#!/bin/bash

#
# for use with a camp pipe delimited file to generate update statements to update customfield1
#


# print out update statements
awk -v tic="'" 'BEGIN { FS = "|" } ; {print "update members set customfield1=ltrim(rtrim(",tic,$20,tic,")) where groupid = ltrim(rtrim(",tic,$2,tic,")) and memberid = ltrim(rtrim(",tic,$3,tic,"))" }' $1

# print out validation script
awk -v tic="'" 'BEGIN { FS = "|" } ; {print "select groupid, memberid, customfield1 from members where groupid = ltrim(rtrim(",tic,$2,tic,")) and memberid = ltrim(rtrim(",tic,$3,tic,"))" }' $1


