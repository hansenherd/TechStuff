#!/bin/bash

# pull the first column of data off of the supplied filename
awk 'BEGIN { FS = "\",\"" } ; {print $4,",", $5 }' $1
