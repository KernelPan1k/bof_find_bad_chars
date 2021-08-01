#!/bin/bash

# x/200xw $esp

< "$1" awk -F"\t" '{print $2$3$4$5}' \
  | sed 's/0x/\n/g' \
  | sed '/^$/d' \
  | sed 's/../&:/g;s/:$//' \
  | awk -F":" '{print $4$3$2$1}' \
  | tr -d "\n" \
  | sed 's/../&:/g;s/:$//' \
  | tr '[:lower:]' '[:upper:]' > /tmp/gdb.txt

< "$2" tr -d "\\" \
  | tr -d "x" \
  | sed 's/../&:/g;s/:$//' \
  | tr '[:lower:]' '[:upper:]' > /tmp/badchar.txt

vimdiff /tmp/gdb.txt /tmp/badchar.txt
