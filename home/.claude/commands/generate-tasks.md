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
- Use checkbox format `- [ ]` for all tasks (see Output Format below)
- Present these tasks to the user in the specified format (without sub-tasks yet)
- Inform the user: "I have generated the high-level tasks based on the PRD. Ready to generate the sub-tasks? Respond with 'Go' to proceed."

### Step 5: Wait for Confirmation
Pause and wait for the user to respond with "Go".

### Step 6: Phase 2 - Generate Sub-Tasks
Once the user confirms, break down each parent task into smaller, actionable sub-tasks:
- **CRITICAL**: Use indented checkbox format `  - [ ]` for sub-tasks (note the 2-space indent)
- Ensure sub-tasks logically follow from the parent task
- Cover the implementation details implied by the PRD
- Consider existing codebase patterns where relevant without being constrained by them
- Each sub-task MUST use checkbox format, NOT bullet points or numbered lists

### Step 7: Identify Relevant Files
Based on the tasks and PRD, identify potential files that will need to be created or modified. List these under the `Relevant Files` section.

### Step 8: Generate Final Output
Save as `tasks-[prd-file-name].md` in `tasks/` directory (e.g., `tasks-prd-user-profile-editing.md`)

## Output Format

**Important: Use checkbox format `- [ ]` for all tasks, not bullet points or headers.**

```markdown
# Tasks for [Feature Name]

## Relevant Files

- `path/to/potential/file1.ts` - Brief description of file relevance
- `path/to/file1.test.ts` - Unit tests for file1
- `path/to/existing/file2.ts` - File that needs modification
...

## Notes

- Important implementation considerations
- Dependencies or prerequisites
- Unit tests should be placed alongside code files
- Use appropriate test command (e.g., `npm test`, `pytest`, etc.)

## Tasks

- [ ] 1. [Parent Task Name]
  - [ ] 1.1 [Sub-task description with specific implementation details]
  - [ ] 1.2 [Sub-task description with file paths and actions]
  - [ ] 1.3 [Sub-task for tests if needed]
- [ ] 2. [Parent Task Name]
  - [ ] 2.1 [Sub-task description]
  - [ ] 2.2 [Sub-task description]
- [ ] 3. [Parent Task Name]
  - [ ] 3.1 [Sub-task description]
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