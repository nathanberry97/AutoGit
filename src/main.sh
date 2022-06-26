#!/bin/bash

while getopts ":c:" opt; do
  case $opt in
    c)
      echo "-c was triggered, Parameter: $OPTARG"
      git add -A
      git commit -m "'$OPTARG'"
      ;;
    \?)
      echo "Invalid option: -$OPTARG"
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument."
      exit 1
      ;;
  esac
done
