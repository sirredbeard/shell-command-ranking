# shell-command-ranking

## ranking.sh

* gets 1000 github repos labeled as containing "shell" ranked by github stars, 10 batches of 100 at a time, with a random sleep to avoid the github rate limit
* exports a list of those repos to repo_list.txt
* shallow clones each of them to /repos
* calls clean_repos.sh on each one to remove extraneous files to save space
* searches for commands in *.sh, *.bash, *.zsh, *.fish, and Dockerfiles
* ranks those commands and outputs to command_ranking.txt

## repo_list.txt

* repos included in data sampling

## command_ranking.txt

* list of bash commands samples detected by ranking.sh from repos from repo_list.txt, ranked in order of usage from most to least

## clean_repos.sh

* deletes extraneous files from the /repos/ dataset to reduce it's size, unless a specific folder is specified as an argument, then it just deleted extraneous files in that folder
* using clean_repos.sh reduces the footprint of cloning ~1000 github repos to ~1 GB
