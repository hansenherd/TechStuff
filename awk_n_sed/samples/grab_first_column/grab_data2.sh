#!/bin/bash


if [ $# -lt 1 ]
then
    echo "ERROR: specify data file as argument"
    exit 1
fi

# pull the first column of data off of the supplied filename
awk -f awk_prog.awk $1
