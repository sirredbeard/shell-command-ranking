# shell-command-ranking

## ranking.sh

* gets top 2500 github repos labeled as containing "shell" ranked by github stars
* exports a list of those repos to repo_list.txt
* shallow clones each of them to /repos
* calls clean_repos.sh on each one to remove extraneous files to save space
* searches for bash commands in *.sh, *.bash, and Dockerfiles
* ranks those commands and outputs to command_ranking.txt

## repo_list.txt

* repos included in sampling

## command_ranking.txt

* list of bash commands samples from in repos from repo_list.txt

## clean_repos.sh

* deletes extraneous files from the /repos/ dataset to reduce it's size, unless a specific folder is specified as an argument, then it just deleted extraneous files in that folder