#!/bin/bash

git_commit() {
  git add -A
  git commit -m "$OPTARG"
  exit 0
}

git_squash() {
  git rebase -i HEAD~$OPTARG
  exit 0
}

auto_help() {
  echo -e "AutoGit - git made easy\n"
  echo -e "Usage: ag [argument] string\n"
  echo "Arguments:"
  echo "  -c        add and commit changes"
  echo "  -s        squash commits"
  echo "  -h        help menu"
  exit 0
}

invalid_option() {
  echo "Invalid option: -$OPTARG"
  exit 1
}

argement_needed() {
  echo "Option -$OPTARG requires an argument."
  exit 1
}

while getopts ":c:s:h?" opt; do
  case $opt in
    c)
      git_commit;;
    s)
      git_squash;;
    h)
      auto_help;;
    \?)
      invalid_option;;
    :)
      argement_needed;;
  esac
done
