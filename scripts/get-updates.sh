#!/bin/bash

# It reads the json file in ~/.yozora/official-updates.json and echos a value for polybar to display.

if ! [ -f ~/.yozora/$1-updates.json ]; then
  echo "x"
  exit 0
fi

json=$(cat ~/.yozora/$1-updates.json)
count=$(echo "$json" | jq '.count')

if [ -z "$count" ]; then
  echo "0"
  exit 0
fi

echo "$count"

