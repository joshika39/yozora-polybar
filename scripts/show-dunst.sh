#!/bin/bash

if [ "$1" == "official" ]; then
  notify-send "Checking for official updates..."
  checkupdates official
elif [ "$1" == "aur" ]; then
  notify-send "Checking for AUR updates..."
  checkupdates aur
else
  notify-send "Invalid argument: $1"
  exit 1
fi



if ! [ -f ~/.yozora/$1-updates.json ]; then
  notify-send "No updates available (no json)"
    exit 0
fi

json=$(cat ~/.yozora/$1-updates.json)
package_names=$(echo "$json" | jq -r '.packages[]')
count=$(echo "$json" | jq '.count')

if [ -z "$package_names" ]; then
  notify-send "No updates available (empty json)"
  exit 0
fi

# Send the notification
notify-send "Updates available ($count): $package_names"
