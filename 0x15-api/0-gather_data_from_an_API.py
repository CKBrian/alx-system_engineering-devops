#!/usr/bin/python3
"""
Defines a module that uses REST API, for a given employee ID & returns
information about his/her TODO list progress.
"""
import json
import requests
import sys
from urllib.request import urlopen


if __name__ == "__main__":
    """Prints employee completed tasks"""
    E_id = sys.argv[1]
    # extracts employee name
    url = "https://jsonplaceholder.typicode.com/users?id={}".format(E_id)
    res = requests.get(url)
    name = res.json()[0].get('name')

    # extracts employee data
    url = "https://jsonplaceholder.typicode.com/todos?userId={}".format(E_id)
    with urlopen(url) as resp:
        data = resp.read().decode("utf-8")
    emp_data = json.loads(data)

    # list of completed titles
    titles = [item.get('title') for item in emp_data if item.get('completed')]

    tasks = len(emp_data)
    c_tasks = len(titles)
    print("Employee {} is done with tasks({}/{})".format(name, c_tasks, tasks))
    for title in titles:
        print("\t {}".format(title))
