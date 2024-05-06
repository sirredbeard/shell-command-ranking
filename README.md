# shell-command-ranking

a [dataset](https://github.com/sirredbeard/shell-command-ranking/raw/main/command_ranking.txt) of the occurrence shell commands used on popular github projects
includes: 
* projects labeled as "shell" programming language
* projects tagged with the bash, zsh, fish, tcsh, ksh and additional relevant topics
* 6,272 projects
* 203,403 unique commands

## [ranking.sh](https://github.com/sirredbeard/shell-command-ranking/blob/main/ranking.sh) - script to collect data

* gets 1000 github repos labeled as containing a shell script language ranked by github stars, 10 batches of 100 at a time (max is 1000), with a random sleep to avoid the github rate limit
* exports a list of those repos to repo_list.txt
* shallow clones each of them to /repos
* calls clean_repos.sh on each one to remove extraneous files to save space
* searches for commands in *.sh, *.bash, *.zsh, *.fish, *.ksh, *.tcsh, and Dockerfiles in /repos
* ranks those commands and outputs to command_ranking.txt

## [repo_list.txt](https://github.com/sirredbeard/shell-command-ranking/blob/main/repo_list.txt) - list of repos queried

* github repos included in data sampling done on February 12, 2024:
    * 990 projects labeled as "shell" programming language
    * 913 additional projects tagged as "bash" topic
    * 791 additionalprojects tagged as "zsh" topic
    * 885 additionalprojects tagged as "fish" topic
    * 33 additional projects tagged as "tcsh" topic
    * 93 additional projects tagged as "ksh" topic
    * 862 additional projects tagged as "linux" topic
    * 806 additional projects tagged as "wsl" topic
    * 896 additional projects tagged as "devops" topic

## [command_ranking.txt](https://github.com/sirredbeard/shell-command-ranking/blob/main/command_ranking.txt) - dataset

* list of shell commands detected by ranking.sh from repos listed in repo_list.txt, ranked in order of usage from most to least

## [clean_repos.sh](https://github.com/sirredbeard/shell-command-ranking/blob/main/clean_repos.sh) - cleanup utility used during data collection to save space

* deletes extraneous files from the /repos/ dataset to reduce it's size, unless a specific folder is specified as an argument, then it just deleted extraneous files in that folder
* using clean_repos.sh reduces the footprint of cloning ~1000 github repos to ~1 GB
