#!/bin/bash

echo
echo from ./put.sh 
echo "TEST1 : PUT with MIN params...move put*1.txt to home dir on demo" 
./sftpToFrom.sh "PUT" "" "" "put*1.txt" "shansen@10.100.2.79"

echo 
echo from ./put.sh
echo TEST2 :  PUT WITH REMOVAL no archiving
./sftpToFrom.sh "PUT" "/home/steveh/src/bash/sftp_cli/test_files" "/home/shansen/sftp_test/puttest2" "put*2.txt" "shansen@10.100.2.79" "" "true" "TEST2 : PUT putfile2.txt to demo - remove locally"

echo
echo from ./put.sh
echo TEST3: PUT WITH ARCHIVING AND REMOVAL
./sftpToFrom.sh "PUT" "/home/steveh/src/bash/sftp_cli/test_files" "/home/shansen/sftp_test/puttest3" "*.txt" "shansen@10.100.2.79" "/home/steveh/src/bash/sftp_cli/test_files/archive" "true" "PUT : with archiving and removal"





