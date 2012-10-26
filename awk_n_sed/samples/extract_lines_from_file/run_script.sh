#!/bin/bash

# pass name of data file as argument

if [ $# -lt 3 ]
then
    echo "ERROR: specify correct arguments"
    echo
    echo "Usage: $ run_script.sh <line1> <line2> <filename>"
    echo "  Extracts rows of the specified file from the specified line1 to line2."
    echo "  e.g. $ run_script.sh 2 3 data.fil"
    exit 1
fi

output_fil="data.txt"

awk "NR==$1,NR==$2 {print}" $3 > $output_fil

if [ $? -eq 0 ]; then
  echo "SUCCESS - data outputed to : ${output_fil}"
else
  echo "FAILED"
fi
