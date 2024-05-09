#!/bin/bash

changed_files=$(git status --porcelain)
commit_msg="Update: $(date +%Y-%m-%d)"

append_msg() {
    commit_msg="$commit_msg, $1"
}

while read -r line; do
    status=${line:0:1}
    file=${line:2}
    echo $status
    case $status in
	    M) append_msg "Modified $file" ;;
	    A) append_msg "Added $file" ;;
	    D) append_msg "Deleted $file" ;;
	    R) append_msg "Renamed $file" ;;
	    C) append_msg "Copied $file" ;;
	    ??) append_msg "Untracked $file" ;;
    esac
done <<< "$changed_files"

git commit -am "$commit_msg"


