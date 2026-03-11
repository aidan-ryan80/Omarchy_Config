#!/bin/bash
# Will exit immediately if a command fails
set -e

# Helper function to print sizes:
print_storage_report() {
    echo "--- Storage Report: $1 ---"
    echo "Overall SSD Usage:"
    df -h /mnt/backup  2>/dev/null || echo "No backup data found."

    echo "Submodule Sizes:"
    du -sh /mnt/backup/mirror /mnt/backup/borg 2>/dev/null || echo "No backup data found."

    if [ -d "/mnt/backup/borg" ]; then
        echo "Borg Repository Details:"
        borg info /mnt/backup/borg
    fi
    echo "---------------------------------"
}

echo "--- Starting Backup: $(date) ---"

# 1. Mounting the drive by Label
# Making sure the drive exists with mkdir -p
mkdir -p /mnt/backup
mount -L BACKUPS /mnt/backup

# 2. Pre-Backup Report
print_storage_report "Pre-Backup"

# 3. Run Rsync Mirror
echo "Running Rsync..."
rsync -avAXH --delete --exclude-from="/home/aidan/.config/rsync/exclude.txt" /home/aidan/ /mnt/backup/mirror/

# 4. Run Borg Backup
echo "Running Borg..."
borg create --stats --compression zstd,3 \
    --exclude-from /home/aidan/.config/borg/borg_exclude.txt \
    /mnt/backup/borg::"home-{now:%Y-%m-%d_%H:%M}" \
    /home/aidan

# 5. Post-Backup Report
print_storage_report "Post-Backup"

# 6. Prune Old Backups
echo "Pruning old backups..."
borg prune -v --list /mnt/backup/borg \
    --keep-daily=7 \
    --keep-weekly=4 \
    --keep-monthly=6 \
    --keep-yearly=2

# 7. Cleanup
echo "Unmounting..."
umount /mnt/backup

echo "--- Backup Completed: $(date) ---"