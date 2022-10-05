#!/bin/bash

# Command Line Input Arguments:
# Four integer values

# Output:
# Sums the first three arguments
# Executes subtractMachine.sh where the first argument is the sum calculated
#and the socend argument is the fourth command line argument supplied to threeAmigos.sh

# Example invocation:
# debian@beaglebone:~$ threeAmigos.sh

echo "Starting the threeAmigos.sh Bash Script"
if [ $# -eq 0 ]; then
  echo "There are no arguments. Usage is:"
  echo -e " ./threeAmigos arg1 arg2 arg3 arg4  "
  echo -e "   where the arguments are integer values  \n e.g. ./threeAmigos 5 5 5 4 "
  exit 2
fi

sum=$(($1+$2+$3))
echo Sum = $sum
./subtractMachine.sh $sum $4

echo Done with threeAmigos script
