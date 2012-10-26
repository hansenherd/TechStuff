#!/bin/bash

# pull the first column of data off of the supplied filename
awk '{print $1 }' $1
