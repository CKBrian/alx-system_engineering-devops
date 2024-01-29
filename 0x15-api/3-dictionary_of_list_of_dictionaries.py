#!/usr/bin/python3
''' Records all tasks that are owned by an employee '''
import json
import requests
from urllib.request import urlopen


def get_list(E_id):
    """Returns a list of an employee tasks"""
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
    titles = [{"username": name, "task": item.get('title'),
               "completed": item.get('completed')} for item in emp_data]
    return titles


if __name__ == "__main__":
    # get employee id
    url = "https://jsonplaceholder.typicode.com/users"
    res = requests.get(url)
    emp_ids = [item.get('id') for item in res.json()]
    title_dict = {Id: get_list(Id) for Id in emp_ids}

    # write to json
    filename = "todo_all_employees.json"
    with open(filename, mode='w', encoding="utf-8") as f:
        json.dump(title_dict, f)
