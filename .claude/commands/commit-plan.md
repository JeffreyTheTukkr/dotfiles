---
description: Inspect the working tree and propose what to commit, grouped into logical commits with a ready-to-paste command block (also copied to the clipboard). Never commits anything itself.
argument-hint: "[path scope] [hint, e.g. 'one commit' or 'split by feature']"
allowed-tools: Bash, Read, Grep, Glob
---

# Commit plan

Work out what should be committed and with which message. Report only.

Arguments given: $ARGUMENTS

Treat arguments as a scope (paths to limit to) or a hint about granularity
("one commit", "split per package"). No arguments means the whole working tree.

## You never write to git

Do not run `git add`, `git commit`, `git stash`, `git restore`, `git reset`, or
`git push`. The user pastes the block themselves. Read-only git only.

## Gather

Run these first, in one batch:

- `git status --porcelain=v1 -uall`
- `git diff --stat` and `git diff --cached --stat`
- `git log -n 20 --pretty=format:%s`
- `git rev-parse --abbrev-ref HEAD`

Then read the actual hunks per file with `git diff -- <path>` and
`git diff --cached -- <path>`, largest-impact files first. Skip the body of
lockfiles, minified bundles, and generated assets; the stat line is enough for
those. Never paste raw diffs into your answer.

Stop and say so if: the tree is clean, a merge/rebase/cherry-pick is in
progress (`git status` says so), or HEAD is detached.

## Message style comes from the log, not from you

The 20 subjects you just read are the spec. If that repo uses
`feat(scope): ...`, follow it. If it uses plain imperative sentences, follow
that. If the log is mixed, follow the most recent 5. Do not impose conventional
commits on a repo that has never used them.

Constraints that always apply:

- One line only. Never a body, never a multi-line message.
- Short and descriptive; say what changed, not how clever it was.
- No em-dashes or en-dashes.
- No backticks and no `$` in the message; both shells expand them inside the
  double quotes of the paste block.
- Apostrophes are fine. Double quotes are not; rewrite around them.

## Grouping

Group by intent, not by directory. A commit is one reviewable idea: the feature
and its test belong together, an unrelated typo fix does not. Order the groups
so each one leaves the tree buildable if applied in sequence.

Prefer few commits. Split only when a reviewer would genuinely want the
histories apart (e.g. a refactor plus a behaviour change; a dependency bump plus
the code that uses it). Say in one line why each split exists.

Call out anything that should NOT be committed and leave it out of every group:
secrets and `.env*`, build output, `node_modules`/`vendor`, debug leftovers
(`var_dump`, `console.log`, `dd()`, commented-out blocks), stray editor or OS
files, a lockfile changed without its manifest. Grep the diff for these; do not
assume.

## Paste block

Emit one line per commit, valid in both bash and fish (the user's shell is
fish), so no arrays, no `export`, no `$'...'`:

```
git add -- <paths> && git commit -m "<message>"
```

Use explicit paths, never `git add .` or `-A`. Quote any path containing a
space. Deletions and untracked files are staged by `git add -- <path>` as-is.

Then put that block on the clipboard: write it to
`$TMPDIR/claude-commit-plan.txt` with a quoted heredoc and run
`pbcopy < $TMPDIR/claude-commit-plan.txt`. If `pbcopy` fails, say so in one
line and move on; the printed block still stands.

## Output

End with exactly this shape and nothing else. No preamble, no narration of the
commands you ran.

```
3 commits, 11 files, on branch feature/checkout

1. fix(checkout): reject expired vouchers before totals run
   src/Checkout/Voucher.php, tests/Unit/VoucherTest.php
   behaviour change, kept apart from the rename below

2. refactor: rename VoucherBag to VoucherCollection
   src/Checkout/VoucherCollection.php, src/Checkout/Cart.php, ...
   pure rename, no behaviour

3. chore(deps): bump vite to 7.1.4
   package.json, pnpm-lock.yaml

git add -- src/Checkout/Voucher.php tests/Unit/VoucherTest.php && git commit -m "fix(checkout): reject expired vouchers before totals run"
git add -- src/Checkout/VoucherCollection.php src/Checkout/Cart.php && git commit -m "refactor: rename VoucherBag to VoucherCollection"
git add -- package.json pnpm-lock.yaml && git commit -m "chore(deps): bump vite to 7.1.4"

Left out: .env.local (secret), dist/ (build output), src/Cart.php:88 (console.log)
Clipboard: 3 commands copied
```

Keep the command lines unwrapped and contiguous, with a blank line above and
below, so one drag selects the whole block. If a group has more than four
files, list three in the summary and end with `...`; the paste line still
carries every path.
