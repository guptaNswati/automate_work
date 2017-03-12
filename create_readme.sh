#!/usr/bin/env bash
# This script creates README for my projects parsing projects html page.
file_to_parse="/vagrant/Desktop/Holberton School's awesome intranet.htm"
file_to_create="/tmp/temp.txt"
lynx -dump $file_to_parse | grep -A20000 "Tasks" test2.txt | tail -n+2 | grep -vE "BUTTON|Help|Score|Done|Examples|Example|example|review" | grep -E "Write|File|Directory|mandatory|advanced" >> $file_to_create
tittle=$(grep -m1 "Directory" $file_to_create)
sed -i '/Directory/d' $file_to_create
sed -r -i 's/\b(mandatory|advanced)\b//g' $file_to_create
sed -i "1s/^/$tittle\n\n /" $file_to_create
head -n -2 $file_to_create > README.md
