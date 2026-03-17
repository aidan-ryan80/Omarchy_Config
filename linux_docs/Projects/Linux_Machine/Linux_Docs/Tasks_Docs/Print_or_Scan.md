### Goal: Figure out how to print or scan images using the HP ENVY 5000 series printer at home

#### Printing:
```bash
lp output.pdf
```

#### Scanning:
##### PNG
```bash
scanimage -d "airscan:e0:HP ENVY 5000 series [C826B7]" --mode Color --resolution 300 --format=png > output.png
```
##### PDF in a single line
```bash
scanimage -d "airscan:e0:HP ENVY 5000 series [C826B7]" --mode Color --resolution 300 --format=pnm | magick - output.pdf
```
