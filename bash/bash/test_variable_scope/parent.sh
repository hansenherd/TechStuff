#/bin/bash

export status="good"

./child.sh
echo $?

echo $status
