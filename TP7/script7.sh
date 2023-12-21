#!/bin/bash

if [ $# -ne 1 ]
then
    echo "Usage: $0 hh:mm:ss"
    exit 1
fi

hh=$(echo $1 | cut -d: -f1)
mm=$(echo $1 | cut -d: -f2)
ss=$(echo $1 | cut -d: -f3)

if [ $hh -gt 23 -o $mm -gt 59 -o $ss -gt 59 ]
then
    echo "Invalid time format"
    exit 2
fi

total=$(($hh * 3600 + $mm * 60 + $ss))
echo $total
