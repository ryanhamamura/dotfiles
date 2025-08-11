# Command: generate-tasks

Generate a detailed, step-by-step task list from an existing Product Requirements Document (PRD).

## Usage
```
generate-tasks <prd-file-path>
```

## Description
This command creates a comprehensive task list in Markdown format based on a PRD. The task list will be structured with parent tasks and detailed sub-tasks, suitable for a junior developer to implement.

## Process

### Step 1: Receive PRD Reference
Accept the PRD file path or content from the user.

### Step 2: Analyze PRD
Extract and understand:
- Feature requirements
- User stories
- Functional specifications
- Technical considerations
- Success criteria

### Step 3: Assess Current State
Analyze the existing codebase to:
- Identify relevant existing files and components
- Understand current architecture
- Find similar patterns to follow
- Note dependencies and integration points

### Step 4: Generate Parent Tasks
Create high-level parent tasks that represent major implementation milestones:
- Each parent task should be a significant, testable deliverable
- Order tasks logically based on dependencies
- Include clear, descriptive names

**STOP AND WAIT**: Present parent tasks to user and wait for "Go" confirmation before proceeding.

### Step 5: Generate Sub-Tasks (After User Confirmation)
For each parent task, create detailed sub-tasks:
- Break down into atomic, actionable steps
- Include specific file paths and function names
- Add technical implementation details
- Specify testing requirements
- Each sub-task should be completable in 1-2 hours

### Step 6: Identify Relevant Files
List all files that will need to be:
- Created (new files)
- Modified (existing files)
- Referenced (for context/patterns)

### Step 7: Generate Final Output & Create Issue
1. Save as `tasks-[prd-file-name].md` in `tasks/` directory
2. Create a GitHub issue with the task list:
   - Title: "[Feature Name] Implementation Tasks"
   - Body: The full task list markdown content
   - Command: `gh issue create --title "[Feature Name] Implementation Tasks" --body "$(cat tasks/tasks-[prd-file-name].md)"`

## Output Format

```markdown
# Tasks for [Feature Name]

## Relevant Files
### To Create:
- `path/to/new/file.ext` - Description

### To Modify:
- `path/to/existing/file.ext` - What changes needed

### For Reference:
- `path/to/reference/file.ext` - Why it's relevant

## Notes
- Important implementation considerations
- Dependencies or prerequisites
- Potential challenges or edge cases

## Tasks

### 1. [Parent Task Name]
**Goal**: Clear description of what this accomplishes

#### 1.1 [Sub-task Name]
- **File**: `path/to/file.ext`
- **Action**: Specific implementation steps
- **Details**: Technical specifics, function names, etc.

#### 1.2 [Sub-task Name]
- **File**: `path/to/file.ext`
- **Action**: Specific implementation steps
- **Testing**: How to verify this works

### 2. [Parent Task Name]
**Goal**: Clear description of what this accomplishes
...
```

## Target Audience
Task lists should be written for junior developers with:
- Explicit file paths and function names
- Clear implementation steps
- References to existing patterns to follow
- Testing requirements for each major component

## Important Notes
- ALWAYS pause after generating parent tasks for user confirmation
- DO NOT proceed to sub-tasks without explicit "Go" from user
- Include estimated time for complex tasks
- Reference existing code patterns when applicable
- Ensure tasks are ordered by dependency

## Interaction Model
1. Generate and present parent tasks
2. **WAIT for user to say "Go"**
3. Only then generate detailed sub-tasks
4. Save complete task list and create GitHub issue

## Output
- **Format**: Markdown (.md)
- **Location**: `tasks/`
- **Filename**: `tasks-[prd-file-name].md`
- **GitHub Issue**: Created with task list content