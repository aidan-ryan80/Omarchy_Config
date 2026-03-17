## **Service & system management**

- **systemctl** — start/stop/enable services, manage targets, reboot/poweroff
    
- **journalctl** — view system logs
    
- **loginctl** — manage logind sessions, seats, users
    
- **hostnamectl** — view/change hostname and related settings
    
- **timedatectl** — time, timezone, and NTP management
##### Set timezone to Europe/Vienna
```bash
timedatectl set-timezone Europe/Vienna
```
- **localectl** — keyboard layouts, locale settings
    

---

## **System boot & unit analysis**

- **systemd-analyze** — boot performance, blame, critical chain
    
- **systemd-cgls** — show control group hierarchy
    
- **systemd-cgtop** — monitor cgroup resource usage
    
- **systemd-escape** — escape strings for unit names
    
- **systemd-path** — show systemd-managed paths
    

---

## **Login, sessions, seats**

- **loginctl** — session/user management
    
- **systemd-run** — run commands as transient units
    

---

## **Networking & hostname**

_(Some distros use additional tools like NetworkManager)_

- **networkctl** — manage systemd-networkd
    
- **resolvectl** — DNS and domain resolution info
    

---

## **Timers & scheduling**

- **systemctl** (with timer units) to inspect timers
    
- **systemd-run --on-calendar=...** to schedule transient timers
    

---

## **File systems & devices**

- **systemd-mount** — mount/automount management
    
- **systemd-umount** — unmounting
    
- **udevadm** — udev device manager tool
    

---

## **Shutdown & power**

- **systemctl poweroff**
    
- **systemctl reboot**
    
- **systemctl suspend / hibernate**