#!/bin/bash

< "$1" cut -d " " -f4 \
  | sed 's/../&:/g;s/:$//' \
  | awk -F":" '{print $4$3$2$1}' \
  | tr -d "\n" \
  | sed 's/../&:/g;s/:$//' \
  | tr '[:lower:]' '[:upper:]' > /tmp/immunity.txt

< "$2" tr -d "\\" \
  | tr -d "x" \
  | sed 's/../&:/g;s/:$//' \
  | tr '[:lower:]' '[:upper:]' > /tmp/badchar.txt

vimdiff /tmp/immunity.txt /tmp/badchar.txt
