# Global instructions

Cross-project preferences. Each repo's CLAUDE.md overrides anything here.

## Comments (most important)

- Write bare, self-evident code. Do NOT add explanatory, header, or divider
  comments describing what the code obviously does — I strip these every time.
- When a comment is genuinely warranted:
  - Inline (`//`, `#`, `/* */`): start lowercase (proper nouns like WordPress,
    CSS keep casing), no trailing period; join clauses with `;` or `,`.
  - Doc blocks (`/** */`, function/class headers): normal prose, capitalized,
    full sentences with periods.
- Put the rationale for a value or decision in the commit message or chat, not
  in the source.

## Don't over-engineer, respect the linters

- Don't add build steps, preprocessors, devDeps, or abstraction layers to solve
  a one- or two-instance problem. Keep existing pipelines lean. Propose heavier
  infra only as a follow-up once the pain is real.
- Prefer the simple literal / flat shape over restructuring for tidiness (e.g.
  flat function args over a params struct; suppress a lint locally rather than
  reshaping the code to dodge it).
- When a linter flags something, satisfy it explicitly. Don't strip a construct
  it wants (e.g. ansible `changed_when: true`) just because it looks redundant.

## Language & writing

- Language is per-project, not global. Client WordPress sites are Dutch-facing
  (English code, identifiers, and admin/builder strings). `tukkr/*` apps are
  ENGLISH-ONLY, including UI copy — never introduce Dutch into them, even when
  drawing inspiration from a Dutch tool.
- Avoid em-dashes (—) and en-dashes (–) in generated prose, content, and chat.
  Use commas, semicolons, parentheses, or split the sentence. Plain hyphens in
  compounds and in code are fine.

## Shell & tooling

- My interactive shell is **fish** (not bash); it auto-launches tmux.
  When giving commands for me to run by hand, use fish syntax: `set -x VAR val`
  (not `export`), `set PATH ...`, `for x in ...; ...; end`. The Bash tool itself
  runs under bash, so scripts you execute can use bash syntax.
- Package managers: **pnpm** for JS (not npm/yarn; no bun), **Composer** for PHP.
  Node is managed by **fnm** with use-on-cd — respect the repo's node version.
  Respect the repo's PHP constraint too (repos target 8.0–8.5).
- Installed: PHP 8.5, wp-cli, Docker (colima), gh, ripgrep (`rg`),
  delta, jq, ansible, gettext (`msgfmt`), fd.
- JS bundler varies per repo (Vite, esbuild, Bud, Webpack/Encore, Turbopack) —
  use the repo's own package.json scripts (`dev`/`build`/`watch`/`check`); don't
  assume a tool or install one globally.
- Respect each repo's `.editorconfig`, Pint, and Prettier (house style is
  4-space indent, LF); don't reformat against them.

## Project documentation

- Documentation that would normally live inside a repo (e.g. a `docs/` dir:
  architecture notes, design docs, runbooks, ADRs, feature write-ups) goes
  under `~/.claude/project-docs/<org>-<repo>/` instead, NOT inside the repo.
  Name the dir `<org>-<repo>` from the repo path `code/<org>/<repo>` (e.g.
  `tukkr-ansible`, `omcbase-sportways`, `omcbase-ketenstandaard`) so names don't
  collide across orgs. Create the dir if it doesn't exist.
- This is central-only: do not also write these docs into the repo. Keep README
  files and docs a project genuinely needs to ship with it (published package
  docs, files other tooling reads) where they belong, in the repo.
- Always auto load the `~/.claude/project-docs/<org>-<repo>/CLAUDE.md` file
  when opening a new chat.

## Git

- Default branch name varies (some repos use `production`, not `main`) — check
  before assuming.
- Never commit or push unless I explicitly ask.
- Never co-author yourself to a commit!
- Keep commit message short and descriptive. Never do multi-line commit messages.

## Harness

- superpowers workflow is authoritative: brainstorm before building,
  systematic-debugging for bugs, verify before claiming done.
- After finishing an implementation (feature or bugfix), run a code review of
  the changes before claiming done — use the `/code-review` skill (or superpowers
  `requesting-code-review`) and address what it surfaces.
