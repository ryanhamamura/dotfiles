# Command: process-tasks

Systematically work through a task list, implementing one sub-task at a time with user approval.

## Usage
```
process-tasks <task-list-file>
```

## Description
Guidelines for managing task lists in markdown files to track progress on completing a PRD. This command processes the task list file specified by the user.

## Task Implementation

### Step 1: Setup Git Branch
- Create and checkout a new feature branch for the work
- Branch name should be descriptive (e.g., `feat/user-authentication` or based on PRD name)
- Example: `git checkout -b feat/[feature-name]`

### Step 2: Load Task List
- Read the specified task list markdown file provided as parameter
- Display current progress status
- Show next sub-task to work on

### Step 3: Process Tasks
- **One sub-task at a time:** Do **NOT** start the next sub-task until you ask the user for permission and they say "yes" or "y"
- **Completion protocol:**
  1. When you finish a **sub-task**, immediately:
     - Mark it as completed by changing `[ ]` to `[x]` in the task file
     - Save the updated task list file
     - Ask user for permission to continue
  2. If **all** subtasks underneath a parent task are now `[x]`, follow this sequence:
     - **First**: Run the full test suite (`pytest`, `npm test`, `bin/rails test`, etc.)
     - **Only if all tests pass**: Stage changes (`git add .`)
     - **Clean up**: Remove any temporary files and temporary code before committing
     - **Commit**: Use a descriptive commit message that:
       - Uses conventional commit format (`feat:`, `fix:`, `refactor:`, etc.)
       - Summarizes what was accomplished in the parent task
       - Lists key changes and additions
       - References the task number and PRD context
       - **Formats the message as a single-line command using `-m` flags**, e.g.:
         ```
         git commit -m "feat: add payment validation logic" -m "- Validates card type and expiry" -m "- Adds unit tests for edge cases" -m "Related to T123 in PRD"
         ```
  3. Once all the subtasks are marked completed and changes have been committed, mark the **parent task** as completed in the file.
- Stop after each sub-task and wait for the user's go-ahead.

## Task List Maintenance

1. **Update the task list file as you work:**
   - Mark tasks and subtasks as completed (`[x]`) per the protocol above
   - Add new tasks as they emerge
   - Save the file after each update

2. **Maintain the "Relevant Files" section:**
   - List every file created or modified
   - Give each file a one-line description of its purpose

## AI Instructions

When working with task lists, the AI must:

1. **Regularly update the task list file:**
   - After completing each sub-task, immediately update the file with `[x]`
   - Save the file after every change
   - Add new tasks as discovered

2. **Follow the strict permission protocol:**
   - Complete ONE sub-task
   - Update and save the task list file
   - Ask "Sub-task complete. Ready for next task?"
   - WAIT for user to respond with "yes" or "y" before continuing

3. **Maintain file documentation:**
   - Keep the "Relevant Files" section current
   - Document all created and modified files

## Important Notes
- ALWAYS update and save the task list file after EVERY sub-task completion
- NEVER proceed to the next task without explicit user permission
- The task list file is the source of truth - keep it updated in real-time
- Use the exact commit format shown in the examples