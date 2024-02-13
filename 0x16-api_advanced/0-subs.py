#!/usr/bin/python3
""""""
import requests


def number_of_subscribers(subreddit):
    """returns the number of subscribers in the Reddit API"""
    url = "https://www.reddit.com/r/{}/about.json".format(subreddit)
    resp = requests.get(url, headers={'User-Agent': 'Leather_Bed_8407'})
    if resp.status_code == 200:
        return resp.json().get('data').get('subscribers')
    else:
        return 0
