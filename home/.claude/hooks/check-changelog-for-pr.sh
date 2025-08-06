#!/bin/bash 

# Hook to check if CHANGELOG.md has been modified before creating a PR 

# Read JSON input from Claude Code 
input=$(cat)

# Extract the command from the JSON input using jq 
command=$(echo "$input" | jq -r '.tool_input.command // empty' 2>/dev/null)

# If jq failed or command is empty, exit 
if [ -z "$command" ]; then 
  exit 0
fi 

# Check if this is a gh pr create command 
if [[ ! "$command" =~ gh[[:space]]+pr[[:space:]]+create ]]; then 
  exit 0 # Not a PR creation command, allow it to proceed 
fi 

# Check if we're in a git repository 
if ! git rev-parse --git-dir > /dev/null 2>&1; then 
  exit 0 # Not in a git repo, allow the command to proceed 
fi

# Get the base branch (usually main or master) 
BASE_BRANCH=$(git symbolic-ref refs/remotes/origin/HEAD 2>/dev/null | sed 's@^refs/remotes/origin/@@') 
if [ -z "$BASE_BRANCH" ]; then
  # Try common default branches 
  if git rev-parse --verify origin/main >/dev/null 2>&1; then
    BASE_BRANCH="main" 
  elif git rev-parse --verify origin/master >/dev/null 2>&1; then 
    BASE_BRANCH="master"
  else 
    # Can't determine base branch, allow PR creation 
    exit 0
  fi
fi

# Check if CHANGELOG.md has been modified compared to the base branch 
if ! git diff --name-only origin/$BASE_BRANCH...HEAD | grep -q "^CHANGELOG.md$"; then
  echo "ERROR: CHANGELOG.md has not been modified!" >&2
  echo "Please update CHANGELOG.md before creating a PR." >&2 
  exit 2 # Exit code 2 blocks the tool call 
fi 

# CHANGELOG.md has been modified, allow PR creation. 
exit 0

