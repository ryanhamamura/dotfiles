# Command: create-prd

Generate a comprehensive Product Requirements Document (PRD) based on user requirements.

## Usage
```
create-prd <feature-description>
```

## Description
This command helps create a detailed Product Requirements Document (PRD) in Markdown format. The PRD will be clear, actionable, and suitable for a junior developer to understand and implement.

## Process

### Step 1: Gather Requirements
Ask clarifying questions to understand:
- **Problem/Goal**: What problem does this feature solve?
- **Target User**: Who is the primary user?
- **Core Functionality**: Key actions users should perform
- **User Stories**: As a [user], I want to [action] so that [benefit]
- **Acceptance Criteria**: Success indicators
- **Scope/Boundaries**: What the feature should NOT do
- **Data Requirements**: Data to display or manipulate
- **Design/UI**: Mockups or UI guidelines
- **Edge Cases**: Error conditions to consider

Present options as numbered/lettered lists for easy selection.

### Step 2: Generate PRD
Create a PRD with these sections:
1. **Introduction/Overview** - Feature description and problem solved
2. **Goals** - Specific, measurable objectives
3. **User Stories** - User narratives with benefits
4. **Functional Requirements** - Numbered list of required functionalities
5. **Non-Goals (Out of Scope)** - What the feature will NOT include
6. **Design Considerations** (Optional) - UI/UX requirements, mockups
7. **Technical Considerations** (Optional) - Constraints, dependencies
8. **Success Metrics** - How to measure feature success
9. **Open Questions** - Areas needing clarification

### Step 3: Save Document & Create Issue
1. Save as `prd-[feature-name].md` in `tasks/` directory
2. Create a GitHub issue with the same content:
   - Title: "[Feature Name]" (descriptive title of the feature/bugfix)
   - Body: The full PRD markdown content
   - Command: `gh issue create --title "[Feature Name]" --body "$(cat tasks/prd-[feature-name].md)"`

## Target Audience
PRDs should be written for junior developers with:
- Explicit, unambiguous requirements
- Minimal jargon
- Sufficient detail to understand purpose and core logic

## Important Notes
- DO NOT start implementing the PRD
- ALWAYS ask clarifying questions first
- Incorporate user answers to improve the PRD

## Example Output
```markdown
# PRD: User Profile Feature

## Introduction/Overview
This feature enables users to create and manage personal profiles...

## Goals
1. Allow users to personalize their experience
2. Enable social features through profile visibility
...
```

## Output
- **Format**: Markdown (.md)
- **Location**: `tasks/`
- **Filename**: `prd-[feature-name].md`
- **GitHub Issue**: Created with same content as markdown file