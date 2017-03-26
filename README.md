# automate_work

This repository contains programs/scripts to help me automate my work.

create_readme.sh - a bash script that creates README for my projects
		 parsing projects html page using lynx.

- Before running the script, type lynx projectURL
- Enter login credentials
- Enter p, click on save to local file, enter file name /tmp/temp1.txt enter q
- Check the txt of html page in /tmp
- Give execution permissions ``` chmod u+x create_readme.s h```
- Run ./create_readme.sh with path to destination directory to save readme
