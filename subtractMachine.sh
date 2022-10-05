#!/bin/bash

# Command Line Input Arguments:
# Two integer values

# Output:
# Subtract the smaller from the larger and then prints out the difference to stdout
# Counts down from the difference to 1 while printing each count to stdout.

# Example invocation:
# debian@beaglebone:~$ subtractMachine.sh 8 3

echo "Starting the subtractMachine Bash Script"
if [ $# -eq 0 ]; then
  echo "There are no arguments. Usage is:"
  echo -e " ./subtractMachine arg1 arg2  "
  echo -e "   where the arguments are integer values  \n e.g. ./subtractMachine 8 3 "
  exit 2
fi

if  [ $(( $2 - $1 )) -gt 0 ] 
then
	echo $2 is larger than $1
	Difference=$(( $2 - $1 ))
else
	echo $1 is larger than $2
	Difference=$(( $1 - $2 ))
fi

echo Difference = $Difference

while [  $Difference -gt 0 ]
do
	echo Count Down = $Difference
	((Difference--))
done

echo All done
