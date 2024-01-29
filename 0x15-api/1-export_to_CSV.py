#!/usr/bin/python3
''' Records all tasks that are owned by an employee '''
import json
import requests
import sys
from urllib.request import urlopen


if __name__ == "__main__":
    E_id = sys.argv[1]
    filename = "{}.csv".format(E_id)

    # extracts employee name
    url = "https://jsonplaceholder.typicode.com/users?id={}".format(E_id)
    res = requests.get(url)
    name = res.json()[0].get('username')

    # extracts employee data
    url = "https://jsonplaceholder.typicode.com/todos?userId={}".format(E_id)
    with urlopen(url) as resp:
        data = resp.read().decode("utf-8")
    emp_data = json.loads(data)

    # Format must be: "USER_ID","USERNAME","TASK_COMPLETED_STATUS","TASK_TITLE"
    titles = '\n'.join('"{}","{}","{}","{}"'.
                       format(item.get('userId'), name, item.get('completed'),
                              item.get('title')) for item in emp_data)

    # write to csv
    with open(filename, mode='w') as f:
        f.write(titles)
