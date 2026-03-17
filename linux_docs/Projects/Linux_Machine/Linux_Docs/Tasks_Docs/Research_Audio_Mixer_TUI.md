### Goal:
##### Fix or figure out how to switch audio output in wiremix TUI without setting defaults

- PipeWire is the multimedia server (audio)
- WirePlumber for session management
- wiremix is the TUI for controlling audio levels and routing
- pactl is the command-line-utility for controlling the pulseaudio server
- Sinks are the output devices

### Save for Later:
- Switch default output to laptop speakers:
```bash
pactl set-default-sink alsa_output.pci-0000_00_1f.3-platform-skl_hda_dsp_generic.HiFi__Speaker__sink
```
- Switch default output to Bluetooth headphones
```bash
pactl set-default-sink bluez_output.F4_2B_7D_35_9F_EF.1
```