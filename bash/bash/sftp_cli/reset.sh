# Test1 PUT
sftp shansen@10.100.2.79<<EOF 
rm puttest1.txt 
quit
EOF

# Test2 PUT
sftp shansen@10.100.2.79<<EOF
rm sftp_test/puttest2/putfile2.txt
quit
EOF
cp test_files/sample test_files/putfile2.txt


# Test3 PUT
sftp shansen@10.100.2.79<<EOF
cd sftp_test/puttest3
rm *.txt
quit
EOF
cp test_files/sample test_files/putfile2.txt
cp test_files/sample test_files/putfile3.txt
rm test_files/archive/*.zip



# Test1 GET
rm ./gettest1.txt

# Test2 GET
rm ./test_files/gettest2.txt

# Test3 GET
sftp shansen@10.100.2.79<<EOF
cd sftp_test
put ./test_files/gettest3.txt
quit
EOF

rm ./test_files/gettest3.txt
