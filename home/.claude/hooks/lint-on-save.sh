#!/bin/bash 

# Lint on save hook for Claude Code 
# Runs appropriate linter based on file extension 

# Read the JSON input from stdin 
input=$(cat) 

# Extract the file path from the JSON input using jq 
file_path=$(echo "$input" | jq -r '.tool_input.file_path // empty' 2>/dev/null)

# If no file path provided, exit 
if [ -z "$file_path" ]; then 
  exit 0
fi 

case "$file_path" in 
  *.rb|*.rake|*.gemspec|*.ru|Gemfile|Rakefile)
    if command -v rubocop > /dev/null 2>&1; then
      rubocop -A "$file_path" 2>/dev/null && echo "   Rubocop: Auto-corrected $(basename "$file_path")"
    fi 
    ;;
esac
