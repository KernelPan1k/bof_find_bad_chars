#!/bin/bash

< "$1" cut -d "|" -f 2 \
  | sed 's/../&:/g;s/:$//' \
  | awk -F":" '{print $4$3$2$1}' \
  | tr -d "\n" \
  | sed 's/../&:/g;s/:$//' \
  | tr '[:lower:]' '[:upper:]' > /tmp/edb.txt

< "$2" tr -d "\\" \
  | tr -d "x" \
  | sed 's/../&:/g;s/:$//' \
  | tr '[:lower:]' '[:upper:]' > /tmp/badchar.txt

vimdiff /tmp/edb.txt /tmp/badchar.txt
