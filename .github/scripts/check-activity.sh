#!/bin/bash

hours="'$2 hours ago'"
branch=$1
originBranch="origin/$branch"
echo $originBranch

# If supplied branch is a wildcard branch, such as release/*, find the most recent concrete branch
if [[ $originBranch =~ "*" ]]; then
  echo "Wildcard supplied: $branch, get most recent branch"
  originBranch=$(git branch -r --list "$originBranch" --sort=-committerdate | head -n 1)
  
  # clean up branch name
  prefix="  "
  originBranch=${originBranch#"$prefix"}
  prefix="* "
  originBranch=${originBranch#"$prefix"}
  prefix="origin/"
  branch=${originBranch#"$prefix"}
fi

echo "found branch [$branch ($originBranch)]"

# export branch name
echo "branch_name=$branch" >> $GITHUB_OUTPUT

# Check if there is any activity on given branch in the given timeframe
echo "new_commit_count=$(git log "$originBranch" --oneline --since "$hours" | wc -l)" >> $GITHUB_OUTPUT