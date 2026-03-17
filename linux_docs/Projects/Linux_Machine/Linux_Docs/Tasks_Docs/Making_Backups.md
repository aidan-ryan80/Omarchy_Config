### Mount my external SSD by using its specified label
```bash
sudo mount -L BACKUPS /mnt/backup
```
### Unmount my exernal SSD
```bash
sudo umount /mnt/backup
```
### Check the size of my external SSD and its submodules
```bash
du -sh /mnt/backup
du -sh /mnt/backup/@mirror
du -sh /mnt/backup/@borg
```
### Using rsync create a mirror backup in the mirror submodule of my mounted ssd
```bash
sudo rsync -avAXHP --delete --exclude-from="/home/aidan/.config/rsync/exclude.txt" --info=progress2 /home/aidan/ /mnt/backup/@mirror/
```
### Using borg to create a timeline of backups in the borg submodule of my mounted ssd
```bash
borg create --stats --progress --compression zstd,3 \
    --exclude-from ~/.config/borg/borg_exclude.txt \
    /mnt/backup/@borg::"home-{now:%Y-%m-%d_%H:%M}" \
    /home/aidan
```
