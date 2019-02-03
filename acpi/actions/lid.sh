#!/bin/bash
export DISPLAY=:0
if grep closed /proc/acpi/button/lid/LID0/state
then
       synclient TouchpadOff=1 2>/dev/tty5 && echo "lid closed, disabling touchpad" >/dev/tty5
else
       synclient TouchpadOff=0 2>/dev/tty5 && echo "lid open, eênabling touchpad" >/dev/tty5
fi
