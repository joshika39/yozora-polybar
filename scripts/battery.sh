#!/bin/sh

# Get the battery percentage or return 0 if the battery is not present
battery=$(sudo tlp-stat -b | tac | grep -m 1 "Charge" |  tr -d -c "[:digit:],.")
if [ -z "$battery" ]; then
    battery=0
fi

echo "# $battery %"
