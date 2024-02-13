#!/usr/bin/python3
"""Defines a function that queries the Reddit API"""
import requests


def word_tally(word, hot_list):
    """counts word in the titles"""
    count = 0
    for title in hot_list:
        count += title.count(word)
    return count


def recurse(subreddit, word_list, hot_list=[], next_page=None):
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
        recurse(subreddit, word_list, hot_list, new_page)

        # count the words in titles
        word_dict = {word: word_tally(word, hot_list) for word in word_list}
        return '\n'.join(f"{key}: {value}" for key, value in word_dict.items())
    else:
        return None


def count_words(subreddit, word_list):
    """Returns the count of words in hot titles in subreddits posts"""
    print(recurse(subreddit, word_list))
