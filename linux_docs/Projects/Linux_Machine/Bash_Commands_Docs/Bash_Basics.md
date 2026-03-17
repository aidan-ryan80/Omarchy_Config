### ls
##### Recursively show file name duplicates
```bash
ls -1 | sort | uniq -d
```
### compgen
##### list all commands you could run in bash
```bash
compgen -c
```
##### list all omarchy commands
```bash
compgen -c | grep -E '^omarchy-' | sort -u
```
##### find omarchy commands by category
```bash
compgen -c | grep -E '^omarchy-theme'
```
### find
**using find to open all pdf's in a directory and its subdirectories**
```shell
find . -type f -name "*.pdf" -exec brave {} \;
```
### For loop for repeating commands
```bash
for i in {1..5}; do echo Testing; done
```