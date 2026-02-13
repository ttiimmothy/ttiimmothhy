#!/bin/bash
COAUTHOR_1_NAME="Timothy"
COAUTHOR_1_EMAIL="timothytimothytimo0@gmail.com"

COAUTHOR_2_NAME="Timothy"
COAUTHOR_2_EMAIL="timothytimodanieliel@gmail.com"

# Loop to create and merge pull requests 10 times
for i in {1..10}
do
  git a .
  # Commit with multiple co-authors using a here document
  git co -F - <<EOF
  no update

  Co-authored-by: $COAUTHOR_1_NAME <$COAUTHOR_1_EMAIL>
  Co-authored-by: $COAUTHOR_2_NAME <$COAUTHOR_2_EMAIL>
EOF
  git push

  # Create a pull request from dev to main using GitHub CLI
  pr_number=$(gh pr create --base main --head dev --title "Merge dev to main for change #$i" --body "Merging changes from dev to main for change #$i")
  # Merge the pull request
  gh pr merge $pr_number --merge

  sleep_duration=$((RANDOM % 3 + 1))
  sleep $sleep_duration
done