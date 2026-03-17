### Goal: Fix Hyprctl detecting a single monitor due to issue with evdi or DisplayLink

**Could also be related to Xorg being used instead of Wayland for some reason in Omarchy**

**? => What is a Compositor on Linux Desktop Environments?**

##### Debugging:
```bash
hyprctl monitors all
```
output:
```bash
Monitor eDP-1 (ID 0):
	1920x1080@60.00000 at 0x0
	description: BOE 0x08C2
	make: BOE
	model: 0x08C2
	physical size (mm): 340x190
	serial:
	active workspace: 1 (1)
	special workspace: 0 ()
	reserved: 0 26 0 0
	scale: 1.33
	transform: 0
	focused: no
	dpmsStatus: 1
	vrr: false
	solitary: 0
	solitaryBlockedBy: windowed mode,missing candidate
	activelyTearing: false
	tearingBlockedBy: next frame is not torn,user settings,missing candidate
	directScanoutTo: 0
	directScanoutBlockedBy: user settings,missing candidate
	disabled: false
	currentFormat: XRGB8888
	mirrorOf: none
	availableModes: 1920x1080@60.00Hz
	colorManagementPreset: srgb
	sdrBrightness: 1.00
	sdrSaturation: 1.00
	sdrMinLuminance: 0.20
	sdrMaxLuminance: 80

Monitor DVI-I-2 (ID 1):
	1920x1080@60.00000 at -1920x0
	description: Acer Technologies B246HL LYDEE0108511
	make: Acer Technologies
	model: B246HL
	physical size (mm): 530x300
	serial: LYDEE0108511
	active workspace: 3 (3)
	special workspace: -98 (special:scratchpad)
	reserved: 0 26 0 0
	scale: 1.00
	transform: 0
	focused: yes
	dpmsStatus: 1
	vrr: false
	solitary: 0
	solitaryBlockedBy: windowed mode,special workspace,missing candidate
	activelyTearing: false
	tearingBlockedBy: next frame is not torn,user settings,missing candidate
	directScanoutTo: 0
	directScanoutBlockedBy: user settings,missing candidate
	disabled: false
	currentFormat: XRGB8888
	mirrorOf: none
	availableModes: 1920x1080@60.00Hz 1920x1080@60.00Hz 1920x1080@59.94Hz 1920x1080@50.00Hz 1680x1050@59.95Hz 1280x1024@75.03Hz 1280x1024@60.02Hz 1440x900@59.89Hz 1280x960@60.00Hz 1280x800@59.81Hz 1152x864@75.00Hz 1280x720@60.00Hz 1280x720@60.00Hz 1280x720@59.94Hz 1280x720@50.00Hz 1024x768@75.03Hz 1024x768@70.07Hz 1024x768@60.00Hz 832x624@74.55Hz 800x600@75.00Hz 800x600@72.19Hz 800x600@60.32Hz 800x600@56.25Hz 720x576@50.00Hz 720x576@50.00Hz 720x480@60.00Hz 720x480@60.00Hz 720x480@59.94Hz 720x480@59.94Hz 720x480@59.94Hz 640x480@75.00Hz 640x480@72.81Hz 640x480@66.67Hz 640x480@60.00Hz 640x480@59.94Hz 640x480@59.94Hz 720x400@70.08Hz
	colorManagementPreset: srgb
	sdrBrightness: 1.00
	sdrSaturation: 1.00
	sdrMinLuminance: 0.20
	sdrMaxLuminance: 80
```
---
```bash
ls /sys/class/drm/ | grep -E 'DP|DVI|HDMI'
```
output:
```bash
lrwxrwxrwx     - root 15 Nov 14:26  card0-DVI-I-1 -> ../../devices/platform/evdi.0/drm/card0/card0-DVI-I-1
lrwxrwxrwx     - root 15 Nov 14:26  card1-eDP-1 -> ../../devices/pci0000:00/0000:00:02.0/drm/card1/card1-eDP-1
lrwxrwxrwx     - root 15 Nov 14:26  card1-HDMI-A-1 -> ../../devices/pci0000:00/0000:00:02.0/drm/card1/card1-HDMI-A-1
lrwxrwxrwx     - root 15 Nov 14:26  card2-DVI-I-2 -> ../../devices/platform/evdi.1/drm/card2/card2-DVI-I-2
```
---
```bash
cat /sys/class/drm/*/status
```
output:
```bash
connected
connected
disconnected
connected
```
---
```bash
lsmod | grep evdi
```
output:
```bash
evdi                  122880  6
```
---
```bash
ps -e -o pid,tty,cmd | grep Xorg   
```
output:
```bash
1332 tty2     /usr/lib/Xorg -nolisten tcp -background none -seat seat0 vt2 -auth /run/sddm/xauth_ENlXbZ -noreset -displayfd 16
12398 pts/1    grep Xorg
```

##### Potential solutions:
```bash
yay -S displaylink evdi-dkms --rebuild
reboot
```

```bash
yay -S displaylink evdi --rebuild
# sudo systemctl restart displaylink.service
reboot
```

```bash
sudo systemctl restart displaylink.service
```