#!/usr/bin/python3

import getpass
import os
import subprocess
import sys

import pygit2
import requests

COOKIES_PATH = '/tmp/jira-tools' # look into using the $TMPDIR env variable before falling back to tmp
REPO_PATH = '/home/kdo/Liferay/ee-plugins'
SESSION_API_URL = 'https://issues.liferay.com/rest/auth/1/session'

def get_branch_name():
    repo = pygit2.Repository(REPO_PATH)

    return repo.head.shorthand

def get_credentials():
    username = input('Username: ')
    password = getpass.getpass()

    return requests.auth.HTTPBasicAuth(username, password)

def get_cookies():
    if os.path.exists(COOKIES_PATH) and os.path.getsize(COOKIES_PATH) > 0:
        file = open(COOKIES_PATH, 'r')

        return dict(JSESSIONID=file.read())

    return False;

def get_title(branch_name):
    url = 'https://issues.liferay.com/rest/api/2/issue/' + branch_name + '?fields=summary'

    cookies = get_cookies()

    if cookies:
        request = requests.get(url, cookies=cookies)
    else:
        auth = get_credentials()

        request = requests.get(url, auth=auth)

        if request.status_code == 200:
            save_cookies(request.cookies['JSESSIONID'])
        else:
            sys.exit()

    if request.status_code == 401:
        os.remove(COOKIES_PATH)

        get_title(branch_name)
    elif request.status_code == 200:
        return branch_name + ' ' + request.json()['fields']['summary']
    else:
        print(request.json()['errorMessages'][0])

def save_cookies(cookies):
    file = open(COOKIES_PATH, 'w')

    file.write(cookies)

    file.close()

def main():
    branch_name = get_branch_name()

    title = get_title(branch_name)

    description = 'Jira Issue: [' + branch_name + '](https://issues.liferay.com/browse/' + branch_name + ')'

    subprocess.call(['gh', 'pr', '-s', sys.argv[1], '-b', sys.argv[2], '-t', title, '-D', description])

main()
