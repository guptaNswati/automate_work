#!/usr/bin/python
from google import search
import urllib
from bs4 import BeautifulSoup
from twython import Twython
import random
from access import *
import subprocess
import sys


"""
This module searches google using python google search library, gets the first
link, and then using Beautiful soup's html parser extracts the title of the news,
creates a tweet and post on twitter, using twitter app credentials, twice a day
at 10.05 am and 5.05 pm. It also notifies if any error occurs in opening the
link or posting  the tweet.
"""
if __name__ == "__main__":
    search_words = ["tech news", "psychology news", "social news", "computer news",
                "science news", "news", "health news", "education news"]
    word = random.choice(search_words)
    count = 0
    for url in search(word, stop=1):
        if count < 1:
            try:
                req = urllib.urlopen(url)
                res = BeautifulSoup(req, "html.parser")
                status = "[Disclaimer: Automatic Tweet]\n" + res.title.text + " " + url
                print status
                twitter = Twython(consumer_key, consumer_secret,
                                  access_token, access_token_secret)
                twitter.update_status(status=status)
            except:
                subprocess.call(["notify-send", "-u", "normal", sys.exc_info()])
        count += 1
