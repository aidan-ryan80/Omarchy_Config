### Checking what package owns a command
```bash
pacman -Qo "$(command -v <cmd>)"
```
##### Example:
```bash
pacman -Qo "$(command -v top)"
```
##### Output:
```bash
/usr/bin/top is owned by procps-ng 4.0.5-3
```
### Checking what commands a package has
```bash
pacman -Ql package_name | grep /usr/bin/
```
##### Example:
```bash
pacman -Ql poppler | grep /usr/bin/
```
##### Output:
```bash
poppler /usr/bin/
poppler /usr/bin/pdfattach
poppler /usr/bin/pdfdetach
poppler /usr/bin/pdffonts
poppler /usr/bin/pdfimages
poppler /usr/bin/pdfinfo
poppler /usr/bin/pdfseparate
poppler /usr/bin/pdfsig
poppler /usr/bin/pdftocairo
poppler /usr/bin/pdftohtml
poppler /usr/bin/pdftoppm
poppler /usr/bin/pdftops
poppler /usr/bin/pdftotext
poppler /usr/bin/pdfunite
```
### Get a list of installed packages from the Arch Native Library
```bash
pacman -Qen
```
### Get a list of installed packages from the Arch User Repository
```bash
pacman -Qem
```