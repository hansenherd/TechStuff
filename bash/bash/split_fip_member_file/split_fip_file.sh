#!/bin/bash

filename=$1
#echo $filename

if [ "$filename" = "" ]; then
  echo "specify file to process"
  exit 1
fi

prefix=`echo $1 | cut -c1-26`
#echo $prefix

split -l 5000 $filename $prefix

for f in `ls "$prefix"??`
do
 if [ -e "$f" ]; then
   suffix=`echo $f | cut -c27-28`

   if [ "$suffix" = "aa" ]; then
     echo "Processing $f"
     mv $f "$f-MEMBER.csv"
   else
     echo "Processing $f"
     newFilename="$f-MEMBER.csv"
     cat "headers.txt" > $newFilename 
     cat $f >> $newFilename
     rm $f
   fi
 fi
done 
