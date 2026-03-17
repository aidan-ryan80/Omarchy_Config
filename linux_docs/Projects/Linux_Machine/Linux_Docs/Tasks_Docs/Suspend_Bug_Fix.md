### To isolate:
- Switch to another TTY and run journalctl -f → suspend/resume → check where it hangs.
- Try a different kernel (LTS vs current).
- Try without GPU drivers (boot with nomodeset or software rendering) to test if it’s graphics related.
- Disable USB autosuspend temporarily:
- echo on | sudo tee /sys/bus/usb/devices/*/power/control
- Check for udev rules delaying resume:
- systemd-analyze blame
- after waking.

✔️ So the procedure is:

Reboot your system

When the login screen appears (SDDM), do NOT log in

Press Ctrl+Alt+F3 to go to a TTY

Log in with your username + password (this is text login, not graphical)

Run the diagnostic commands I listed earlier

bind / unbind evdi:

/🔒 ❯ sudo modprobe -r evdi
[sudo] password for aidan:

/🔒 ❯ sudo modprobe evdi

/🔒 ❯