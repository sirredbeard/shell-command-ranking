#!/bin/bash

export YOUR_GITHUB_TOKEN="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"

# Get the top 1000 repositories
echo "Getting the top 1000 repositories in batches of 100"
for i in {1..10}; do
    echo "Getting batch of 100 number $i of 10"
    repos_page=$(curl -H "Accept: application/vnd.github.v3+json" -H "Authorization: token $YOUR_GITHUB_TOKEN" "https://api.github.com/search/repositories?q=language:shell&sort=stars&per_page=100&page=$i" | jq -r '.items[].clone_url')
    repos="$repos $repos_page"
    sleep_time=$((RANDOM % 20 + 10))
    echo "Sleeping for $sleep_time seconds..."
    sleep $sleep_time
done
echo "Writing the list of repositories to repo_list.txt"
echo "$repos" >> repo_list.txt

# Shallow clone each repository and clean up the repo of unwanted extensions if that was successful
echo "Cloning each repository and cleaning up unwanted files"
for repo in $repos; do
    git clone --depth 1 "$repo" repos/$(basename "$repo") && ./clean_repos.sh repos/$(basename "$repo")
done

# Search each repository for shell commands
echo "Searching each repository for shell commands"
declare -A command_counts
for repo in repos/*; do
    # Find all .sh, .bash files and Dockerfiles
    while read -r file; do
        if [[ $file == *Dockerfile ]]; then
            commands=$(grep -oP '^RUN\s*\K\w+' "$file")
        else
            commands=$(grep -oP '^\s*\K\w+' "$file")
        fi
        for command in $commands; do
            ((command_counts["$command"]++))
        done
    done < <(find "$repo" -name "*.sh" -o -name "*.bash" -o -name "Dockerfile" -o -name "*.zsh" -o -name "*.fish")
done

# Print the commands and their counts, sorted by count
echo "Printing the commands and their counts, sorted by count, to command_ranking.txt"
for command in "${!command_counts[@]}"; do
    echo "$command: ${command_counts[$command]}"
done | sort -rn -k2 > command_ranking.txt
