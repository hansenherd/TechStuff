#!/bin/bash

if [ $# -lt 1 ]
then
    echo "ERROR: specify data file as argument"
    exit 1
fi

# Note: IFS (Internal Field Separator) can be set for the read command as shown below
var=192.168.1.3
IFS=. read -r -a myArray <<< "$var"
echo "Test 1: parse using the dot as a field separator)"
echo ${var}
echo ${myArray[0]}
echo ${myArray[1]}
echo ${myArray[2]}
echo ${myArray[3]}
echo ${myArray[4]}
echo
echo


# the default IFS(Interal Field Separator) is whitespace for the read command
echo "Test 2: parse words using a space as the delimiter"
var="hello out there world"
read -r -a myArray <<< ${var}
echo ${var}
echo ${myArray[0]}
echo ${myArray[1]}
echo ${myArray[2]}
echo ${myArray[3]}
echo ${myArray[4]}
echo
echo


# the default IFS(Interal Field Separator) is whitespace for the read command
echo "Test 3: pull a column of data from a text file and use a space to parse it into an array"
var=`awk -f pull_data.awk $1`
read -r -a myArray <<< ${var}

echo ${var}
echo ${myArray[0]}
echo ${myArray[1]}
echo ${myArray[2]}
echo ${myArray[3]}
echo ${myArray[4]}

echo "loop through the entire array"
for i in ${myArray[@]}; do
  echo $i
done


# this simple example works
echo "Test 4: create my own array and show how to access it's parts"
ARRAY=(one two three)
echo "simple example"
echo ${ARRAY[*]}
echo ${ARRAY[@]}
echo ${ARRAY[0]}
echo ${ARRAY[1]}
