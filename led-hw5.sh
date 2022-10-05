#!/bin/bash
# A small Bash script to set up User LED3 to be turned on or off from 
#  Linux console. Written by Derek Molloy (derekmolloy.ie) for the 
#  book Exploring BeagleBone.

# Updated by Brian Hinger 10/4/2022
# Added two new command line argumments called "blink" and an integer "n".
# The script will blink USR3 LED n times.
# The LED will remain on for 1 second and off for 1 second.

# Example invocation to blink the LED 5 times:
# ./led-hw5.sh blink 5

LED3_PATH=/sys/class/leds/beaglebone:green:usr3

# Example bash function
function removeTrigger
{
  echo "none" >> "$LED3_PATH/trigger"
}

echo "Starting the LED Bash Script"
if [ $# -eq 0 ]; then
  echo "There are no arguments. Usage is:"
  echo -e " bashLED Command \n  where command is one of "
  echo -e "   on, off, flash or status  \n e.g. bashLED on "
  echo -e " New command added: ./led-hw5.sh blink n \n where USR3 LED blinks on and off n times"
  exit 2
fi
echo "The LED Command that was passed is: $1"
if [ "$1" == "on" ]; then
  echo "Turning the LED on"
  removeTrigger
  echo "1" >> "$LED3_PATH/brightness"
elif [ "$1" == "off" ]; then
  echo "Turning the LED off"
  removeTrigger
  echo "0" >> "$LED3_PATH/brightness"
elif [ "$1" == "flash" ]; then
  echo "Flashing the LED"
  removeTrigger
  echo "timer" >> "$LED3_PATH/trigger"
  sleep 1
  echo "100" >> "$LED3_PATH/delay_off"
  echo "100" >> "$LED3_PATH/delay_on"
elif [ "$1" == "status" ]; then
  cat "$LED3_PATH/trigger";

elif [ "$1" == "blink" ]; then
  echo "Blinking the LED $2 times"
  count=$2
  while [ $count -gt 0 ]
  do
	echo "1" >> "$LED3_PATH/brightness"	#LED on
	sleep 1		# Delay for 1 second
	echo "0" >> "$LED3_PATH/brightness"	#LED off
	sleep 1		# Delay for 1 second
	((count--))
  done
fi
echo "End of the LED Bash Script"
