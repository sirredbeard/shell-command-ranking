# shell-command-ranking

## ranking.sh

* gets 1000 github repos labeled as containing a shell script language ranked by github stars, 10 batches of 100 at a time, with a random sleep to avoid the github rate limit
* exports a list of those repos to repo_list.txt
* shallow clones each of them to /repos
* calls clean_repos.sh on each one to remove extraneous files to save space
* searches for commands in *.sh, *.bash, *.zsh, *.fish, and Dockerfiles
* ranks those commands and outputs to command_ranking.txt

## repo_list.txt

* github repos included in data sampling done on February 12, 2024
    * ~1000 projects tagged as "shell"
    * ~1000 projects tagged as "bash"
    * ~1000 projects tagged as "zsh"
    * ~1000 projects tagged as "fish"
* even if the github api returned duplicate projects, the ranking.sh will not git clone duplicate projects, so that will not affect totals in command_ranking.txt

## command_ranking.txt

* list of shell commands detected by ranking.sh from repos listed in repo_list.txt, ranked in order of usage from most to least

## clean_repos.sh

* deletes extraneous files from the /repos/ dataset to reduce it's size, unless a specific folder is specified as an argument, then it just deleted extraneous files in that folder
* using clean_repos.sh reduces the footprint of cloning ~1000 github repos to ~1 GB
