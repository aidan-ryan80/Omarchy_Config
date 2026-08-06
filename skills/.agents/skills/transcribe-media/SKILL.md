---
name: transcribe-media
description: Turn a media file (video or audio) into a well-formatted markdown transcript. Use when asked to transcribe a video/audio/podcast/meeting/lecture/interview, convert a file to text, or summarize a recording. Extracts audio with ffmpeg if needed, transcribes with voxtype (Whisper, correct language), formats a readable markdown file, and appends a summary at the bottom. If the recording is not in English, also adds an English translation and an English summary section.
---

# Transcribe media → formatted markdown transcript

Workflow to turn any media file (mp4, mov, webm, mkv, m4a, mp3, wav, ...) into a
clean, readable markdown transcript with a summary at the bottom, and — when the
source is not English — an English translation + English summary as well.

## Prerequisites

- `ffmpeg` (audio extraction, WAV conversion)
- `voxtype` (installed; `voxtype --version`) with the Whisper model `large-v3-turbo`
  (at `~/.local/share/voxtype/models/ggml-large-v3-turbo.bin`). Other models
  (`base`, `small`, `medium`, `large-v3`) are fallbacks when turbo crashes.
- `whisper` model download: `voxtype setup model` if the model file is missing.

## Step 1 — Determine the language

- If the user states the language (e.g. "German", "Hungarian"), use it. Map it to
  the voxtype/ISO code (`de`, `hu`, `fr`, `en`, `es`, `it`, `nl`, `pl`, ...).
- If unknown, detect it: run voxtype once with `--language auto` (it reports the
  detected language in the log line `Detected language: <xx>` in stderr).
- **English** is the special case: if the audio is English, no translation is
  needed; produce only the transcript + summary. For any other language, plan for
  an English translation and an English summary section.

## Step 2 — Extract / normalize audio

Voxtype needs **WAV, 16 kHz, mono**. Convert in place with ffmpeg:

```bash
ffmpeg -y -i "input.mp4" -ar 16000 -ac 1 "output.wav"
```

If the input is already a 16 kHz mono WAV, skip this step. Check with
`ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1 file`.

Note the duration — it decides the chunking strategy in Step 3.

## Step 3 — Transcribe with voxtype

### Single pass first (default)

Try a **single pass on the whole file** first. Separate stdout and stderr so you
can check the result cleanly, and record the exit code:

```bash
voxtype --model large-v3-turbo --language <LANG> transcribe "input.wav" \
  > out.txt 2> err.txt
echo "exit=$?"
```

**Key points (these are what usually go wrong):**
- **Separate stdout and stderr** (`> out 2> err`). The model/Vulkan/GPU logs go
  to stderr and must never be merged into the transcript.
- The exit code and **whether stdout is blank** tell you if it worked, not just
  the presence of text. Whisper (`large-v3-turbo`) occasionally emits a token
  that is not valid UTF-8 ("Invalid UTF-8 detected in a string from Whisper.
  Index: ..."), which makes voxtype abort with a non-zero exit code and an empty
  transcript.

### Fall back to chunking only if the single pass fails

Use chunking **only as a last resort**, i.e. when the single pass either exits
non-zero or produces a **blank transcript file**. Splitting into ~60-second
chunks resets the decode context per chunk and avoids the Invalid UTF-8 crash.

```bash
TMP=$(mktemp -d)
ffmpeg -v error -i "input.wav" -f segment -segment_time 60 -c copy "$TMP/chunk_%03d.wav"
cd "$TMP"
: > full.txt
: > failed.log
for f in chunk_*.wav; do
  voxtype --model large-v3-turbo --language <LANG> transcribe "$f" > "out_$f.txt" 2> "err_$f.txt"
  if grep -qE 'Error' "err_$f.txt"; then
    echo "FAILED: $f" >> failed.log
  else
    awk '{ gsub(/\x1B\[[0-9;]*m/, ""); if (NF && $0 !~ /^(Loading audio file:|Audio format:|Processing [0-9]|\[?[0-9]{4}-[0-9]{2}-[0-9]{2}T)/) print }' "out_$f.txt" >> full.txt
  fi
done
```

- Strip **ANSI escape codes** and the voxtype header lines (`Loading audio file:`,
  `Audio format:`, `Processing ...`, timestamped `INFO:` lines). The awk line
  above does both.
- Any chunk still failing with the Invalid UTF-8 error: retry that chunk with a
  different split offset (e.g. `-segment_time 90` or `-ss` shift) or a smaller
  model (`--model base`). Zero failures is the normal outcome.

The final result is one line of transcript per chunk in `full.txt`. Copy it to a
working file before formatting.

## Step 4 — Clean the transcript content

- Drop model **hallucinations** that are not speech. The most common one from
  `large-v3` is the token **`NAMASTE`** appearing on silence at the end of chunks
  — delete it.
- Correct **obvious ASR mishearings** (homophones, wrong diacritics) only when the
  intended word is unambiguous from context. Never silently rewrite whole
  sentences. Mark genuinely unintelligible parts as `[?]`.
- Preserve names/places that the user confirms (e.g. "Denver" is Denver, Colorado).
- Do **not** retype Hungarian/German text from scratch — work from the existing
  transcript and apply edits, or you will introduce new errors.

## Step 5 — Build the markdown file

Name the output `<SOURCE_BASENAME>_transcript.md` next to the source file.

Structure:

```markdown
# <Title> (transcript)

*Note: <method line, e.g.> Whisper large-v3-turbo (Hungarian) transcript,
corrected for obvious mishearings; hallucinations removed; uncertain spots marked
[?]. The English section below is a faithful translation.*

---

## <Original language, e.g. Magyar> (transcript)

<Readable paragraphs, no code fences, speaker turns split sensibly>

---

## English translation

<Faithful English rendering of the whole transcript, paragraph-matched>

---

## Összefoglaló / Summary

<Bottom summary in the original language>

---

## Summary (English)

<English summary at the very bottom — required whenever the source language is
not English; optional otherwise>
```

Rules:
- Summary goes at the **very bottom**.
- When the source is **not English**, include BOTH the original-language summary
  and an **English `## Summary`** section at the bottom.
- When the source **is English**, one summary section suffices.
- Keep the header note in English so readers understand the file.
- Formatting conventions for German/Hungarian text: load the matching
  `austrian-german-proofreading` / `hungarian-proofreading` skills for register,
  diacritics, and translation quality.

## Step 6 — Verify

- `grep` the final markdown for leftover noise (`NAMASTE`, `ggml_`, `whisper_`,
  ANSI escapes, `Loading audio file`) — should be empty.
- Confirm every chunk is present (line count ≈ chunk count) and that the summary
  and (if needed) English sections exist at the bottom.
- Report to the user: output path, chunk/failure counts, language used, and any
  spots left as `[?]`.

## Step 7 — Offer .docx conversion

After the markdown file is complete and verified, **ask the user** whether they
also want a .docx version of the transcript. Ask before finalizing the report
("Do you want a .docx version of this transcript as well?").

- If **yes**, convert with pandoc (best formatting fidelity — headings, tables,
  and styles carry over):

  ```bash
  pandoc "<SOURCE_BASENAME>_transcript.md" -o "<SOURCE_BASENAME>_transcript.docx"
  ```

  Verify the .docx was created and report its path alongside the markdown one.
- If **no**, skip the conversion silently and report only the markdown path.

## Language + translation reference

- Voxtype language flag: `--language <ISO>` (e.g. `hu`, `de`). Comma-separated
  values are for **language detection**, not multilingual output.
- For an English-only result, voxtype has a `--translate` flag
  ("translate non-English speech to English"). It is a global option, usable with
  `voxtype --model ... --language <LANG> --translate transcribe file.wav`.
  Otherwise produce the translation yourself in the markdown (preferred for
  quality and for keeping the original-language section).
