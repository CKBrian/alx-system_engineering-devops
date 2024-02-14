#!/usr/bin/python3
"""Defines a function that queries the Reddit API"""
import requests


def number_of_subscribers(subreddit):
    '''returns number of subscribers or 0 if subreddit is invalid'''
    if subreddit is None or not isinstance(subreddit, str):
        return 0
    url = 'https://www.reddit.com/r/{}/about.json'.format(subreddit)
    res = requests.get(url, headers={
                       'User-Agent': 'Directory0x16-api_advanced'}).json()
    count = 0
    if 'error' not in res.keys():
        count = res.get('data').get('subscribers')
    return count
