### Goal: Search Machine for installed packages or commands that I can run in the terminal.

##### List all commands that could be run in bash
```bash
compgen -c
```
##### Search by keyword in the local package database
```bash
pacman -Qs foo_bar
```
##### Search by keyword in package database
```bash
pacman -Ss foo_bar
```
##### Search which package owns a command
```shell
pacman -Qo "$(command -v <cmd>)"
```
##### Search which package contains specific Files / Commands
```bash
pacman -F glow
```