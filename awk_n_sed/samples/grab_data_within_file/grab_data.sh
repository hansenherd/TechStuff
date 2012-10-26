#!/bin/bash

if [ $# -lt 1 ]
then
    echo "ERROR: specify data file as argument"
    exit 1
fi

# pull data from within the middle of a files text
awk -f pull_data.awk $1
