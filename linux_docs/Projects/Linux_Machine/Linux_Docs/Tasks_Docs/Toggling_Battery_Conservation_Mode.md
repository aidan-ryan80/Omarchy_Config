### Goal:
##### Create a command for the terminal or button on waybar to toggle battery conservation mode

- Create bash script or command to run from the terminal 🤓
- Create button on waybar that does this feature 🤓
- Make this a toggle feature into omarchy-walker by extending it
### Commands:
- Disabling battery conservation mode
```bash
echo 0 | sudo tee /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode
```
- Enabling battery conservation mode
```bash
echo 1 | sudo tee /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode
```
- Checking battery conservation mode: (1 is on and 0 is off)
```bash
cat /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode
```
- editing the ideapad-battery.service file
```bash
n /etc/systemd/system/ideapad-battery.service
```

Dear Rubén,



I wanted to inform you that I will be absent from the 23rd to the 27th of March to participate in an Erasmus Short Term Blended Mobility in Dortmund. 



The mobility concerns a Software Engineering Project that focuses on Modular Monolithic Architecture, which actually aligns closely with some of the topics we are covering in your course.



While I understand that I am excused from classes during this period, I wanted to reach out to ensure I stay on track. Aside from reviewing the lecture materials I miss, are there any specific assignments or coursework I should complete in the meantime?



Best Regards,



Aidan Ryan