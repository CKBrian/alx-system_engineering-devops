#!/usr/bin/python3
"""Defines a function that queries the Reddit API"""
import requests


def top_ten(subreddit):
    """returns titles of the first 10 hot posts
       listed for a given subreddit."""
    url = "https://www.reddit.com/r/{}/hot.json".format(subreddit)
    resp = requests.get(url, headers={'User-Agent': 'Leather_Bed_8407'},
                        allow_redirects=False)
    if resp.status_code == 200:
        data = resp.json().get('data').get('children')
        hot_posts = [title.get('data').get('title') for title in data]
        posts = hot_posts[:10]
        print('\n'.join(post for post in posts))
    else:
        print(None)
