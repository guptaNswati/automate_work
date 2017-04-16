B1;2c# tweet_daily

tweet_daily.py - a python script that tweets the top news of randomly selected
	       topics, searching from google, twice a day at 10.05 am and 5.05 pm
	       via "crontab". It also notifies if there is an error, using
	       "notify-send".
	       The script searches google using python google search library,
	       gets the first link, and then using Beautiful soup's html parser
	       extracts the title of the news, creates a tweet and post on twitter.
	       Note: Needs to have twitter app before reading and writing to twitter.
	       Ref: https://dev.twitter.com/overview/api

- give execution permissions ```chmod u+x tweet_daily.py```
- run: ./tweet_daily.py or python tweet_daily.py
- to add a crontab: type crontab -e, choose the editor and add at bottom of file
  * * * * /path/to/tweet_daily.py (min hour dayofmonth month dayofweek
  i.e.the time to run the script and path to script or cmd)
- check the current crontab, type crontab -l
- to get notified: ref: https://github.com/fgrehm/vagrant-notify
- or if needs to send email: ref http://www.mkyong.com/python/how-do-send-email-in-python-via-smtplib/