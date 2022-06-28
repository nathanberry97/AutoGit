#!/bin/bash

git_commit() {
  git add -A
  git commit -m "$OPTARG"
  exit 0
}

git_branch() {
  git branch $OPTARG
  git checkout $OPTARG
  exit 0
}

git_new_repo() {
  touch README.md
  git init
  git add README.md
  git commit -m "first commit"
  git remote add origin https://github.com/nathanberry97/$OPTARG.git
  git push -u origin master
  exit 0
}

git_squash() {
  git rebase -i HEAD~$OPTARG
  exit 0
}

auto_help() {
  echo -e "AutoGit - git made easy\n"
  echo -e "Usage: ag [argument] string"
  echo -e "   or: ag [argument]"
  echo -e "   or: ag [no flag runs git status]\n"
  echo "Arguments:"
  echo "  -r        create new repo and push to github"
  echo "  -c        add and commit changes"
  echo "  -b        create new branch and checkout into it"
  echo "  -s        squash commits"
  echo "  -h        help menu"
  exit 0
}

invalid_option() {
  echo "Invalid option: -$OPTARG"
  exit 1
}

argument_needed() {
  echo "Option -$OPTARG requires an argument."
  exit 1
}

while getopts ":r:c:b:s:h?" opt; do
  case $opt in
    r)
      git_new_repo;;
    c)
      git_commit;;
    b)
      git_branch;;
    s)
      git_squash;;
    h)
      auto_help;;
    \?)
      invalid_option;;
    :)
      argument_needed;;
  esac
done

git status
