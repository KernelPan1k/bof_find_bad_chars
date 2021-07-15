#!/bin/bash

# x/200xw $esp

file_input="$1"
file_badchars="$2"

the_input="$(cat "$1" | cut -d "|" -f 2 | sed 's/../&:/g;s/:$//' | awk -F":" '{print $4$3$2$1}' | tr -d "\n" | sed 's/../&:/g;s/:$//' | tr '[:lower:]' '[:upper:]')"
the_badchar="$(cat "$2" | tr -d "\\" | tr -d "x" | sed 's/../&:/g;s/:$//' | tr '[:lower:]' '[:upper:]')"

echo "$the_input" > /tmp/theinput.txt
echo "$the_badchar" > /tmp/thebadchar.txt

vimdiff /tmp/theinput.txt /tmp/thebadchar.txt

