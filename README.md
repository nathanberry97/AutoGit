# AutoGit - git made easy

This project has been made to automate git commands within a simple bash script

I would recommend adding the script to you rc file, for example I use zsh
and in my .zshrc file I have the following:

```console
alias ag="/Users/nathan/.scripts/autogit/main.sh"
```

> **note** the following section will assume that you are using the ag alias
> (ag ~ AutoGit)

At present the program can do the following:

| command        | desription                             |
|----------------|----------------------------------------|
| ag -r [string] | initialise new git repos               |
| ag -c [string] | add and commit changes                 |
| ag -b [string] | create new branch and checkout into it |
| ag -s [int]    | squash merge                           |
| ag -h          | help menu                              |


## priview

![image](images/AutoGit.png)
