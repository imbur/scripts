#!/bin/bash

set -o nounset      # Treat unset variables as an error

. credentials.txt   # GitHub user ADMIN and its GitHub TOKEN is sourced

ORG=orgName
REPO=repoName
USERID=collaboratorGHid

# Create repo
curl -u $ADMIN:$TOKEN https://api.github.com/orgs/$ORG/repos -d '{"name":"$REPO", "description":"", "private": true, "has_issues": true, "has_projects": true, "has_wiki":true }'

# Add collaborator
curl -i -u $ADMIN:$TOKEN -X PUT -d "" https://api.github.com/repos/$ORG/$REPO/collaborators/$USERID

