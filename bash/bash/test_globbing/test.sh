#!/bin/bash

echo '   ... echo "$1"   -->' "$1"
echo '   ... echo $1     -->' $1
echo '   ... echo "${1}" -->' "${1}"
echo '   ... echo ${1}   -->' ${1}

