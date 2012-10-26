#!/bin/bash

echo 
echo 'GLOBBING ENABLED'
echo
echo 'pass filespec as *.txt'
./test.sh *.txt

echo 'pass filespec as "*.txt"'
./test.sh "*.txt"

echo 'pass filespec as '\''*.txt'\'
./test.sh '*.txt'

echo 
echo 'GLOBBING DISABLED'
echo

echo 'set -f'
set -f 
echo
echo 'pass filespec as *.txt'
./test.sh *.txt

echo 'pass filespec as "*.txt"'
./test.sh "*.txt"

echo 'pass filespec as '\''*.txt'\'
./test.sh '*.txt'


