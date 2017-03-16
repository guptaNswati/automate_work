#!/usr/bin/env bash
# This script creates README for my projects parsing projects html page.
# First create plain txt of project html page: use lynx url and enter login credentials
file_to_parse="/tmp/temp1.txt"
file_to_create="/tmp/temp.txt"
lynx -dump $file_to_parse | grep -A20000 "Tasks" | tail -n+2 | grep -vE "BUTTON|Help|Score|Done|Examples|Example|example|review" | grep -E "mandatory|advanced|Write|Directory|File" >> $file_to_create
tittle=$(grep -m1 "Directory" $file_to_create)
sed -i '/Directory/d' $file_to_create
sed -r -i 's/\b(mandatory|advanced)\b//g' $file_to_create
sed -i "1s/^/$tittle\n\n /" $file_to_create
# folder to save readme is specified in arg
mv $file_to_create "$1/README.md"
# to remove unwanted end lines
# head -n -2 $file_to_create >> "$1/README.md"
