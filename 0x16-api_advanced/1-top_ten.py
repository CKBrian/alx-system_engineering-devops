#!/usr/bin/python3
""""""
import requests


def top_ten(subreddit):
    """returns titles of the first 10 hot posts
       listed for a given subreddit."""
    url = "https://www.reddit.com/r/{}/top.json".format(subreddit)
    resp = requests.get(url, headers={'User-Agent': 'Leather_Bed_8407'})
    if resp.status_code == 200:
        data = resp.json().get('data').get('children')
        top_posts = [title.get('data').get('title') for title in data]
        posts = top_posts[:10]
        print('\n'.join(post for post in posts))
    else:
        print(None)
