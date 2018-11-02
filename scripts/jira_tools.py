#!/usr/bin/env python3

import getpass
import os
import pathlib
import subprocess
import sys

import pygit2
import requests

# TODO: look into using the $TMPDIR env variable before falling back to tmp
COOKIES_PATH = '/tmp/jira-tools'
SESSION_API_URL = 'https://issues.liferay.com/rest/auth/1/session'


def fetch_jira_issue():
    branch_name = get_branch_name()

    url = 'https://issues.liferay.com/rest/api/2/issue/' \
        + branch_name \
        + '?fields=summary,issuetype'

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

        fetch_jira_issue()
    elif request.status_code == 200:
        return request.json()
    else:
        print(request.json()['errorMessages'][0])


def get_branch_name():
    branch_name = ''

    if len(sys.argv) > 3:
        branch_name = sys.argv[3]
    elif branch_name == '':
        cwd = os.getcwd()

        git_path = str(get_top_level(cwd))

        repo = pygit2.Repository(git_path)

        branch_name = repo.head.shorthand

    return branch_name


def get_credentials():
    username = input('Username: ')
    password = getpass.getpass()

    return requests.auth.HTTPBasicAuth(username, password)


def get_cookies():
    if os.path.exists(COOKIES_PATH) and os.path.getsize(COOKIES_PATH) > 0:
        file = open(COOKIES_PATH, 'r')

        return dict(JSESSIONID=file.read())

    return False


def get_description(jira_issue):
    branch_name = jira_issue['key']

    return 'Jira Issue: [' \
        + branch_name \
        + '](https://issues.liferay.com/browse/' \
        + branch_name \
        + ')'


def get_labels(jira_issue):
    issue_type = jira_issue['fields']['issuetype']['name']

    labels_list = ['Review Needed']

    if issue_type == 'Bug':
        labels_list.append('Bugfix')
    elif issue_type == 'Story':
        labels_list.append('Feature')

    return ','.join(labels_list)


def get_title(jira_issue):
    return jira_issue['key'] + ' ' + jira_issue['fields']['summary']


def get_top_level(path, last=None):
    path = pathlib.Path(path).absolute()

    if path == last:
        return None

    if (path / '.git').is_dir():
        return path

    return get_top_level(path.parent, last=path)


def save_cookies(cookies):
    file = open(COOKIES_PATH, 'w')

    file.write(cookies)

    file.close()


def update_jira_ticket(values):
    return


def main():
    jira_issue = fetch_jira_issue()

    title = get_title(jira_issue)

    description = get_description(jira_issue)

    labels = get_labels(jira_issue)

    message = title + '\n\n' + description

    base = sys.argv[1] + ':' + sys.argv[2]

    subprocess.call([
        'hub',
        'pull-request',
        '-o',
        '-m',
        message,
        '-b',
        base,
        '-l',
        labels
    ])


main()
