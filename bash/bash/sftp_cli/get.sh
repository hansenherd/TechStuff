#!/bin/bash

#echo "GET *.txt"
#./sftpToFrom.sh "GET" "/home/steveh/src/bash/sftp_cli/test_files" "/home/shansen/sftp_test" "*.txt" "shansen@10.100.2.79" "" "true" "GET : my local sftp test"

echo
echo "from ./get.sh"
echo "TEST1 : GET *.txt - with minimum params"
./sftpToFrom.sh "GET" "" "" "*.txt" "shansen@10.100.2.79"

echo
echo "from ./get.sh"
echo "TEST2 : GET *.txt - NO ARCHIVING OR REMOVAL SPECIFIED"
./sftpToFrom.sh "GET" "/home/steveh/src/bash/sftp_cli/test_files" "/home/shansen/sftp_test" "get*2.txt" "shansen@10.100.2.79"


echo
echo "from ./get.sh"
echo "TEST3 : GET *.txt - full params specified"
./sftpToFrom.sh "GET" "/home/steveh/src/bash/sftp_cli/test_files" "/home/shansen/sftp_test" "get*3.txt" "shansen@10.100.2.79" "/home/steveh/src/bash/sftp_cli/test_files/archive" "true" "Test3 : GET description is HERE"


# tests below were to try out the regex matching for various file specs

##echo "GET MOD*.txt"
#./sftpToFrom.sh "GET" "/home/shansen/sftp_test" "/home/steveh/src/bash/sftp_cli/test_files" "MOD*.txt" "shansen@10.100.2.79" "" "true" "GET : my local sftp test"

#echo "GET ADC*DEF*.XML.PGP"
#./sftpToFrom.sh "GET" "/home/shansen/sftp_test" "/home/steveh/src/bash/sftp_cli/test_files" "ADC*DEF*.XML.PGP" "shansen@10.100.2.79" "" "true" "GET : my local sftp test"

#echo "GET ADC*DEF*.XML.PGP"
#./sftpToFrom.sh "GET" "/home/shansen/sftp_test" "/home/steveh/src/bash/sftp_cli/test_files" "www*.XML.PGP" "shansen@10.100.2.79" "" "true" "GET : my local sftp test"



