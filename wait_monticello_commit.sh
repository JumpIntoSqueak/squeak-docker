#!/bin/bash -e

while true; do

inotifywait -e DELETE_SELF repository/*.package/monticello.meta/version
sleep 5
file=$(git diff --name-only | grep /version$)
# quotes in Monticello commit messages are represented as double quotes
message=`sed "s/^(name '[^']*' message '\(\([^']\|''\)*\)'.*/\1/" "$file" \
    | sed "s/''/'/g"`
git add --all repository/
git commit --message "$message"

done
