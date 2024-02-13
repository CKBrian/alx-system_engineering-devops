#!/usr/bin/python3
"""Defines a function that queries the Reddit API"""
import requests


def number_of_subscribers(subreddit):
    """returns the number of subscribers in the Reddit API"""
    url = "https://www.reddit.com/r/{}/about.json".format(subreddit)
    resp = requests.get(url, headers={'User-Agent': 'CKBrian7'},
                        allow_redirects=False)
    if resp.status_code == 200:
        return resp.json().get('data').get('subscribers')
    else:
        return 0