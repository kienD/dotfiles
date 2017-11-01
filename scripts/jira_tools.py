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

def create_new_session():
    auth = get_credentials()

    request = requests.get(SESSION_API_URL, headers={'content-type': 'application/json'}, auth=auth)

    print(request.status_code)

    if request.status_code == 401 or request.status_code == 403:
        print('Try logging in again')

        create_new_session()
    elif request.status_code == 200:
        save_cookie(request.cookies['JSESSIONID'])
    else:
        print('We cannot complete your request at this time.  Please try again later.')

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
    else:
        create_new_session()

def get_title(branch_name):
    cookies = get_cookies()

    url = 'https://issues.liferay.com/rest/api/2/issue/' + branch_name + '?fields=summary'

    request = requests.get(url, cookies=cookies)

    if request.status_code == 401:
        create_new_session()
    elif request.status_code == 200:
        return branch_name + ' ' + request.json()['fields']['summary']
    else:
        print('We cannot complete your request at this time.  Please try again later.')

def save_cookie(cookie):
    file = open(COOKIES_PATH, 'w')

    file.write(cookie)

    file.close()

def main():
    branch_name = get_branch_name()

    title = get_title(branch_name)

    description = 'Jira Issue: [' + branch_name + '](https://issues.liferay.com/browse/' + branch_name + ')'

    subprocess.call(['gh', 'pr', '-s', sys.argv[1], '-b', sys.argv[2], '-t', title, '-D', description])

main()
