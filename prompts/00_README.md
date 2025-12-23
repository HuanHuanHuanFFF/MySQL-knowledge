# Prompt Playbook

Use these prompts with Cursor/Codex to batch-generate MySQL cards, stacks, experiments, and snippets.

## Card linking rules (global, mandatory)
- Each CARD has exactly one `Up` via `stack:` front matter pointing to its owning STACK.
- `related` is optional (<=3). Only add when strong and necessary: relation types are Prereq, Next, Compare, Expand, Example.
- Multi-linking lives mainly in STACKS for directory/chapters; CARD-to-CARD links only when understanding would break without them.
- Avoid fully connected meshes; prefer tree/chain structures; mark relation type in each `related` item.

## Prompt intents
- distill_cards: turn sources into short atomic cards; auto assign to a STACK; add only necessary related links.
- build_stack_from_cards: reorder existing cards into a STACK with directory bullets plus embed sequence.
- make_experiments: derive 1-3 reproducible EXP items for key claims.
- make_snippets: derive copy/paste SQL templates from cards or problems.
- build_sources_nav: create/maintain SOURCES navigation with links and key bullets only.
- update_home_index: refresh 00_HOME/00_INDEX so entrances stay clear.

## Usage notes
- Keep cards atomic and short; one idea per file.
- Use evidence sparingly: at most one [[EXP/...]] or [[SNIPPETS/...]] per CARD.
- When adding related links, explain the rationale in the card body.
