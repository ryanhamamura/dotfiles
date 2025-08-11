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

### Step 4: Phase 1 - Generate Parent Tasks
Based on the PRD analysis and current state assessment:
- Create the file and generate the main, high-level tasks required to implement the feature
- Use your judgement on how many high-level tasks to use (likely about 5)
- Present these tasks to the user in the specified format (without sub-tasks yet)
- Inform the user: "I have generated the high-level tasks based on the PRD. Ready to generate the sub-tasks? Respond with 'Go' to proceed."

### Step 5: Wait for Confirmation
Pause and wait for the user to respond with "Go".

### Step 6: Phase 2 - Generate Sub-Tasks
Once the user confirms, break down each parent task into smaller, actionable sub-tasks:
- Ensure sub-tasks logically follow from the parent task
- Cover the implementation details implied by the PRD
- Consider existing codebase patterns where relevant without being constrained by them

### Step 7: Identify Relevant Files
Based on the tasks and PRD, identify potential files that will need to be created or modified. List these under the `Relevant Files` section.

### Step 8: Generate Final Output
Save as `tasks-[prd-file-name].md` in `tasks/` directory (e.g., `tasks-prd-user-profile-editing.md`)

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
4. Save complete task list

## Output
- **Format**: Markdown (.md)
- **Location**: `tasks/`
- **Filename**: `tasks-[prd-file-name].md` (e.g., `tasks-prd-user-profile-editing.md`)