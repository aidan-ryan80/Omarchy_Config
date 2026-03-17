### Goal: Docs for updating mirrors list on Arch Linux

### Commands
- Using reflector to update mirrors list
```bash
sudo reflector --latest 10 --sort rate --save /etc/pacman.d/mirrorlist
```
##### Check mirrors **without overwriting your mirrorlist**
```bash
reflector --latest 10 --sort rate --verbose
```
##### Get 20 fastest fresh https mirrors list in Countries close to Austria
```bash
sudo reflector --country Austria,Germany,Switzerland --latest 20 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
```