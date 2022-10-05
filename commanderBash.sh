#!/bin/bash

# Command Line Input Arguments:
# None

# Output:
# 


# Example invocation:
# debian@beaglebone:~$ ./commanderBash.sh

echo "Starting the commanderBash.sh Bash Script"
count=$(cat invocationCount.int)
echo $(($count+1)) > invocationCount.int;
if [ $count  -gt 4 ]; then
	echo 1 > invocationCount.int; 
fi

echo "Current invocation count = $count"

if [ $count -eq 1 ]; then
	echo "Turning LED on"
	./led-hw5.sh on

elif [ $count -eq 2 ]; then 
	echo "Turning LED off"
	./led-hw5.sh off

elif [ $count -eq 3 ]; then
	echo "Checking LED status"
	./led-hw5.sh status

elif [ $count -eq 4 ]; then
	echo "Flashing the LED"
	sudo ./led-hw5.sh flash

elif [ $count -eq 5 ]; then
	echo "Blinking the LED 3 times"
	./led-hw5.sh blink 3

fi 

echo "Exiting the commanderBash.sh Bash Script"
