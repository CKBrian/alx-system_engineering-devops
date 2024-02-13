#!/usr/bin/python3
"""Defines a function that queries the Reddit API"""
import requests


def recurse(subreddit, hot_list=[], next_page=None):
    """returns titles of the first 10 hot posts
       listed for a given subreddit."""
    url = "https://www.reddit.com/r/{}/hot.json?after={}".format(subreddit,
                                                                 next_page)
    resp = requests.get(url, headers={'User-Agent': 'Holberton_8407'},
                        allow_redirects=False)
    if resp.status_code == 200:
        data = resp.json().get('data').get('children')
        new_list = [title.get('data').get('title') for title in data]
        hot_list.extend(new_list)
        new_page = resp.json().get('data').get('after')
        return recurse(subreddit, hot_list, new_page)
    else:
        return None
