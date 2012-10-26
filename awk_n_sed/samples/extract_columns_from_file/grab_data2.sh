#!/bin/bash

# pull the first column of data off of the supplied filename
#awk 'BEGIN { FS = "\",\"" } ; {print "INSERT INTO tmp.zions_update_data values(",$5,");" }' $1
awk 'BEGIN { FS = "\",\"" } ; {print $5; }' $1

