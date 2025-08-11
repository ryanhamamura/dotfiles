# Command: process-tasks

Systematically work through a task list, implementing one sub-task at a time with user approval.

## Usage
```
process-tasks <task-list-file>
```

## Description
This command helps process an existing task list file by implementing tasks one at a time, updating progress, and maintaining documentation throughout the implementation.

## Process

### Step 1: Load Task List
- Read the specified task list markdown file
- Display current progress status
- Show next sub-task to work on

### Step 2: Implement Sub-Tasks (One at a Time)
For each sub-task:
1. **Display**: Show the current sub-task details
2. **Implement**: Complete the implementation
3. **Mark Complete**: Update task with `[x]` immediately upon completion
4. **Update Files Section**: Add/update the "Relevant Files" section
5. **Save Progress**: Save the updated task list file
6. **Request Permission**: Ask user "Ready to proceed to next task?" and WAIT for approval

### Step 3: Parent Task Completion
When all sub-tasks of a parent task are complete:
1. Mark parent task as complete `[x]`
2. Run relevant tests for that component
3. Fix any test failures before proceeding
4. Update task list file

### Step 4: Full Completion Protocol
When ALL tasks are complete:
1. **Run Full Test Suite**: Execute all project tests
   ```bash
   npm test  # or appropriate test command
   ```
2. **Fix Any Failures**: Address all test failures
3. **Stage Changes**: 
   ```bash
   git add .
   ```
4. **Clean Up**: Remove any temporary files
5. **Create Commit**: Use conventional commit format
   ```bash
   git commit -m "feat: [feature name] implementation complete"
   ```
6. **Update GitHub Issue**: Comment on the issue with completion status

## Task List Maintenance

### Continuous Updates
- Mark tasks complete immediately when done
- Add newly discovered tasks as they emerge
- Update time estimates if significantly different
- Document blockers or issues encountered

### Relevant Files Section
Maintain an up-to-date list of:
```markdown
## Relevant Files
### Created:
- `path/to/new/file.ext` - Brief description

### Modified:
- `path/to/modified/file.ext` - What was changed

### Deleted:
- `path/to/deleted/file.ext` - Why it was removed
```

## Implementation Guidelines

### One Task at a Time
- NEVER work on multiple sub-tasks simultaneously
- Complete current task fully before moving on
- Document any dependencies discovered

### Permission Protocol
After EACH sub-task:
1. Save all file changes
2. Update task list with `[x]`
3. Display completion message
4. Ask: "Sub-task complete. Ready for next task?"
5. WAIT for user response before continuing

### Error Handling
If a task cannot be completed:
- Mark as blocked (not complete)
- Add note explaining the blocker
- Create new task for resolving the blocker
- Ask user how to proceed

## Progress Tracking

### Status Indicators
- `[ ]` - Not started
- `[x]` - Completed
- `[~]` - In progress (current task)
- `[!]` - Blocked

### Progress Display
Show progress regularly:
```
Progress: 5/12 sub-tasks complete (42%)
Current: Task 2.3 - Implement user validation
```

## Important Notes
- ALWAYS wait for user permission between tasks
- NEVER skip the completion protocol
- Update task list file after EVERY change
- Keep commit messages descriptive and conventional
- Test continuously, not just at the end
- Document all file changes in the Relevant Files section

## Output
- **Updated task list**: Continuously saved to original file
- **Git commits**: Created upon full completion
- **GitHub issue updates**: Progress comments as needed
- **Test results**: Displayed after each parent task