# automate_work

This repository contains programs/scripts to help me automate my work.

create_readme.sh - a bash script that creates README for my projects
		 parsing projects html page using lynx.
- Usage:
- Before running the script, type lynx projectURL
- enter login credentials
- enter p, click on save to local file, enter file name /tmp/temp1.txt enter q
- Check the txt of html page in /tmp
- to script give  execution permissions ``` chmod u+x create_readme.s h```
- execute ./create_readme.sh with path to destination directory to save readme
