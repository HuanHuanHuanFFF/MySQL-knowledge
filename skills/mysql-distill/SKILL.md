---
name: mysql-distill
description: Use when working in the user's MySQL Obsidian vault to distill local sources into CARD, STACK, QA, and REVIEW artifacts. Prefer problem-first explanations, minimal effective models, and repository-native rules. When this skill is triggered, first load prompts/mysql_distill_doctrine.prompt.md if it exists.
---

# MySQL Distill

Use this skill for tasks inside the user's MySQL Obsidian vault when the goal is to distill, reorganize, or review MySQL knowledge from local materials.

## Use this skill when

- The repository is a MySQL learning vault with folders such as `CARDS/`, `STACKS/`, `QA/`, `REVIEW/`, and `sources/`.
- The user wants MySQL knowledge distilled into cards, stack pages, question-driven guides, or review pages.
- The task depends on local repository materials rather than web research.

## First steps

1. Read `prompts/mysql_distill_doctrine.prompt.md` if it exists.
2. If that file does not exist, read `prompts/00_README.md` and any task-specific prompt the user named.
3. Inspect the relevant existing files in `STACKS/`, `CARDS/`, `QA/`, `REVIEW/`, and `sources/` before editing.

## Core working rules

- Use only local repository materials unless the user explicitly changes that rule.
- When sources conflict, prefer `sources/refman-*`, then `sources/JavaGuide-mysql`, then other local notes.
- Do not invent unsupported conclusions. If the repository cannot support a conclusion, write `TODO` instead of guessing.
- Prefer the smallest change that improves the reading path.
- Preserve existing naming style and directory structure unless the user asks for a restructure.

## Distillation style

Default to this chain:

problem -> motivation -> design -> mechanism -> effect -> cost -> boundary

Write for understanding, not rote recall.

- Start from the problem being solved.
- Give the smallest useful mental model first.
- Clarify confusing neighboring concepts directly.
- Keep interview relevance and engineering tradeoffs visible.
- Avoid filler, teaching-tone narration, and term dumps.

## Artifact selection

- `CARD`: one atomic point, short and reusable.
- `STACK`: the main reading path; organize cards into a sequence worth reading.
- `QA`: one high-value question that guides reading across multiple cards.
- `REVIEW`: short recall prompts; not the place for full explanations.

## Review formatting

If generating or repairing review pages, keep the repository's strict structure:

```html
<details>
<summary>Q...：...？</summary>
A：
- ...
</details>

See: [[CARDS/xxx]]

---
```

Rules:
- No `.md` in `See` links.
- `See:` stays outside `</details>`.
- Keep answers short unless the user explicitly asks for expansion.

## Output behavior

- If the user asked for direct repository edits, edit files in place and summarize changes.
- If the user explicitly asked for multi-file output, use the repository's `FILE: <path>` format.
- Keep responses concise.
