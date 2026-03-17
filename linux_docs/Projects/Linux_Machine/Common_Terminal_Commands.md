### Bash Basics => [[Bash_Basics]]
### Pacman => [[Pacman]]
### Neovim => [[Neovim]]
### Python => [[Python]]
### SSH => [[SSH]]
### Git => [[Git]]
### Libreoffice => [[Libreoffice]]
### Systemd => 
### Bash Piping Commands

# Process the below (from ChatGPT)
# Bash Commands: Built-ins vs External Programs

## Bash Built-ins

These run **inside the current shell** and **do not create a new process**.

**Common built-ins:**

- `cd`  
- `echo`
- `printf`
- `source` / `.`
- `exit`
- `pwd`
- `alias`, `unalias`
- `export`
- `readonly`
- `history`
- `type`
- `set`, `unset`
- `shift`
- `read`    
- `test` / `[`
- `true`, `false`

**Key characteristics:**

- Implemented directly by the **bash shell**
- Run without spawning another process

---

## External Commands

These are separate executables found in directories like `/usr/bin` or `/bin`.  
Running them **creates a new process**.

**Common external commands:**

- `touch`    
- `ls`
- `cp`
- `mv`
- `rm`
- `cat`
- `grep`
- `sed`
- `awk`
- `chmod`    
- `chown`
- `find`
- `ps`
- `kill`
- `tar`
- `curl`
- `wget`

**Key characteristics:**

- Stored as standalone binaries
    
- Require process creation to run
    

---
