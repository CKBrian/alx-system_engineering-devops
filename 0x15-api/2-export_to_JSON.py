#!/usr/bin/python3
''' Records all tasks that are owned by an employee '''
import json
import requests
import sys
from urllib.request import urlopen


if __name__ == "__main__":
    E_id = sys.argv[1]
    filename = "{}.json".format(E_id)

    # extracts employee name
    url = "https://jsonplaceholder.typicode.com/users?id={}".format(E_id)
    res = requests.get(url)
    name = res.json()[0].get('username')

    # extracts employee data
    url = "https://jsonplaceholder.typicode.com/todos?userId={}".format(E_id)
    with urlopen(url) as resp:
        data = resp.read().decode("utf-8")
    emp_data = json.loads(data)

    # Format{ "USER_ID": [{"task": "TASK_TITLE", "completed":
    #                  TASK_COMPLETED_STATUS, "username": "USERNAME"},{... ]}
    titles = [{"task": item.get('title'), "completed": item.get('completed'),
               "username": name} for item in emp_data]
    title_dict = {E_id: titles}
    print(title_dict)
    # write to json
    with open(filename, mode='w', encoding="utf-8") as f:
        json.dump(title_dict, f)
