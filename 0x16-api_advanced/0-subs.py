#!/usr/bin/python3
""""""
import requests


def number_of_subscribers(subreddit):
    """returns the number of subscribers in the Reddit API"""
    url = "https://www.reddit.com/r/{}/about.json".format(subreddit)
    resp = requests.get(url).json()
    return resp.get('data').get('subscribers')
