#!/usr/bin/env bash
# This script creates README for my projects parsing projects html page.
# First create plain txt of project html page: use lynx url
# enter login credentials, Press p and on click on "Save to local file"
# enter /tmp/temp1.txt and press q, check plain txt of the html page in /tmp
# run this file with path of readme destination directory


file_to_parse="/tmp/temp1.txt"
file_to_create="/tmp/temp.txt"
filter_out="BUTTON|Help|Score|Done|Examples|Example|Repo|test|container|@|review"
filter_in="mandatory|advanced|write|directory|file|"


lynx -dump $file_to_parse | grep -A20000 "Tasks" | tail -n+2 | grep -ivE "$filter_out" | grep -E "$filter_in" >> $file_to_create


# save directory name for  the heading of the readme
tittle=$(grep -m1 "Directory" $file_to_create)


# remove repetitive and unwanted lines
sed -i '/Directory/d' $file_to_create
sed -r -i 's/\b(mandatory|advanced)\b//g' $file_to_create
sed -i "1s/^/$tittle\n\n /" $file_to_create


# folder to save readme is specified in arg
mv $file_to_create "$1/README.md"


# to remove unwanted end lines
#head -n -2 $file_to_create >> "$1/README.md"
