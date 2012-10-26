#!/bin/bash

if [ $# -lt 1 ]
then
    echo "ERROR: specify data file as argument"
    exit 1
fi

output_fil="output.sql"

# pass name of data file as argument
awk -f awk_prog.awk $1 > $output_fil

if [ $? -eq 0 ]; then
  echo "SUCCESS - data outputed to : ${output_fil}"
else
  echo "FAILED"
fi
