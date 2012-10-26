#!/bin/bash

# removes all lines beginning with -- from testFile.txt and creates a new file
sed '/^--/ d' testFile.txt > testFile_new.txt
