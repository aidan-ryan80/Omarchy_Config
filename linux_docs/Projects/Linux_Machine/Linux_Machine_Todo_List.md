1. Set up Monitors 🤓 😮‍💨
	1. Fix Positioning of Laptop display vs Monitors
2. Test Volume  🤓
3. Fix volume keys 🤓
4. Connecting Bluetooth Devices 🤓 😮‍💨
5. Test Audio TUI wiremix to be able to switch between output devices 
6. How to search my system for packages or bash commands I could run 🤓 => [[Searching_Things]]
7. Set up Google Calendar Web App and Replace HEY Calendar with it 🤓
8. Set up Gmail Web App and Replace HEY Calendar with it 🤓
9. Set up a macro to always unfocus text field even in apps that don't have this feature
10. Add ctrl + Backspace to delete whole words in the terminal 🤓
11. Have the num pad when on be treated the same as normal num keys (super + 1 from num pad should work) (Do I want this?)
12. Why does pressing PrtSc without function result in a "S"?****
13. Figure out how to adjust brightness on external monitors 😞 (Not Linux's Fault)
14. Fix Caps lock key
15. Configure volume keys to work on my external keyboard 
16. Configure brightness keys to work on my external keyboard
17. Figure out how to make backups for my machine using an external SSD 🤓
18. Configure default apps for all file types. .py, .txt, etc should be configured to nvim => [[Config Default Apps for file types in Nautilus]] 🤓 (O)
19. Fix opening files from nautilus to nvim => [[Fix Nautilus to nvim]] 🤓 (O)
20. Fix Brave Browser on multiple monitors => [[Fixing Brave on my Machine ✔]] 😀 (O)
21. Add German Keyboard and Keybinding for switching keyboards
22. What is the Difference between sudo and startup/reboot omarchy passwords? 
	1. Is the Full Disk Encryption Password for my drive
23. Configure alacritty 🤓
24. Get HP printer to work 🤓 [[Print_or_Scan]]
	1. Get scanning to work 🤓 😮‍💨
	2. Attempt scanning straight to pdf instead of to png (For this use a command that does it directly)
25. Way to totally Full screen a window in Hyprland without the borders. Create keybinding for this 🤓
26. How do Notifications work? 🤓 (O)
27. Play CK2 and Minecraft without problems 🤓
28. Test Discord calls 🤓
29. Test Teams Calls 🤓
30. Test Webcam and scree sharing 🤓
31. Why is num pad always enabled on startup?
32. Look into OS keychain and why Git, VS Code, and Chromium all want to use it
33. Configure my terminal emulator to allow Highlight text in the terminal with SHIFT + Arrow Keys?
34. Configure TLP to allow power profiles and integrate it with the Waybar?
35. Create a button on the Waybar to toggle battery saver mode for my Lenovo Ideapad 3 Laptop => [[Toggling_Battery_Conservation_Mode]]
	1. Will I need the tlp package for this?
36. After Rebooting why are only workspaces 1 and 4 "open" with being able to move between them with super + tab
37. Find a good password manager for linux. Maybe check Louis Rossman Linux Wiki for this?
38. Fix or figure out how to switch audio output in wiremix TUI without setting defaults =>  [[Switch Audio output in wiremix TUI]]
39. Fix Chromium Theme on startup when Nord Theme is Selected 🤓
40. What is Default Keyring on my machine? => [[Default Keyring Research]] 🤓
41. Make a notification for when battery is below 20%, 10%, and below 5% (also possibly make waybar red or a brighter color to notify the user when below 5%?)
42. Add low level remapping of keys from external keyboards to allow the keys above the F keys to work like on the laptop => [[Low Level Keyboard Remapping]]
43. Create Doc for updating Arch Linux Mirrors List => [[Updating Mirrors List Docs]]
44. Add py shortcut for python to my terminal config
45. Debug brave or chromium processes sometimes causing the machine to freeze and needing to terminate the whole browser. 8gb is really to little ram even on Arch Linux?
46. Check whether the Magic SysRq keys are enabled on my system and if not enable them
47. DisplayLink single monitor detected by hyprctl => [[Hyprctl_Single_Monitor_Detected]]
48. `xdg-open` used for opening chromium instead of brave for some links from other applications. Do I need to change my default browser to Brave somewhere?
49. Why do I need to hit the keybinding for Toggling Workspace Gaps twice for it to take effect? 🤓 (O)
50. Self Host or Download Websites that have documentation for the following tools (Using Kiwix?)
	1. Neovim
	2. SQLite
	3. Python
	4. Go
	5. Bash
	6. Docker
51. Fix Screen Recording Feature
52. Add Omarchy Themes to Obsidian
53. Add config for Obsidian to have default hotkeys
54. Look into Lutris (open gaming platform)
55. Configure System Sleep
56. What is Omarchy Power Profile Menu?
57. What is Invoke Last Notification Keybinding?
58. What are Power Profiles on Arch / Omarchy?
59. Can you sync the certain parts of different file systems together on Linux? For example to sync the School directory and its subdirectories on my laptop together with the same directories on my desktop?
60. Figure out what the default Omarchy Keybindings are and compare them to my keybindings
61. Should the scratchpad be disappearing when I focus on the workspace it is currently up on? Should it not stay there and act as the workplace displayed there until I toggle it away? This seems to only happen sometimes, such as in one instance from Teams Web App to my browser and the other way around. Seems random for when it does and doesn't happen.
62. Top Bar (Waybar) only shows the circular arrow for a update being available after toggling the top bar (Check whether it shows it after suspend, restart, or reboot)
63. When the machine locks itself and it is unlocked the Window that was full-screened is minimized again. Is there a way to prevent this?
64. Holding CTRL or another keybinding when scrolling the audio icon on waybar to adjust the volume percentage by 1 percent instead of 5 percent
65. Create a bash script for automating making Mirror and Archival Backups (rsync and borg)
	1. Add being able to run the script without sudo and to only use sudo in the script for mounting and unmounting. Otherwise use normal user permissions.
66. Set up Obsidian as a knowledge base with git used for version control
67. Figure out what created ideapad-battery.service (Install script when first running Omarchy?)
68. Fix two `/home/aidan/.local/bin` paths appearing in $PATH instead of a single one
	1. On many modern Arch installs, systemd automatically adds `~/.local/bin` to the user's environment if the directory exists. You can verify this by running `systemd-path user-binaries`
69. What is `xdg-open` on my machine and how to I configure it to use Brave instead of Chromium?
70. Switching Themes seems to exit full screen mode in the window I am viewing. Check what else switching themes changes and try to make it seamless.
71. How often should I run `pacman -Syu` and `pacman -Scc`?
72. Do I want to configure fastfetch and have it appear in my terminal by default
73. Do I want to configure starship for myself?
74. Look into how to use the following commands:
	1. `fd` package instead of find
	2. `fzf`: command line fuzzy finder
	3. `gh`: GitHub CLI tool
	4. `htop`: Use this for viewing processes or `top` or `btop`?
	5. `shellcheck`: Use this for checking my bash scripts?
	6. `strace`: Use this for debugging?
	7. `wev`: Use this for debugging stuff in Wayland + Hyprland?