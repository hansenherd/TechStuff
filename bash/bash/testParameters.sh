#!/bin/bash
# arglist.sh
# Invoke this script with several arguments, such as "one two three".
E_BADARGS=65
if [ ! -n "$1" ]
then
echo "Usage: `basename $0` argument1 argument2 etc."
exit $E_BADARGS
fi
echo
index=1  # Initialize count.

echo "List first argument ( \$0 )"
echo $0
echo
echo

echo "List second argument ( \$1 )"
echo $1
echo
echo

echo "Listing args with \"\$*\":"
for arg in "$*" # Doesn't work properly if "$*" isn't quoted.
  do
    echo "Arg #$index = $arg"
    let "index+=1"
  done
# $* sees all arguments as single word.
echo "Entire arg list seen as single word."
echo
echo

index=1  # Initialize count.

echo "Listing args with \"\$@\":"
for arg in "$@" # Doesn't work properly if "$@" isn't quoted.
  do
    echo "Arg #$index = $arg"
    let "index+=1"
  done
# $@ sees all arguments as single word.
echo "Entire arg list seen as separate words."

echo
sleep 3;
echo "Script ran for $SECONDS seconds."

