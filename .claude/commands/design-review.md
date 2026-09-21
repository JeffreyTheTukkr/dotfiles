---
description: Compare a built page against its Figma source and report measured mismatches. Use after building or changing a section derived from a Figma design, or when a built section looks off ("still not centered", "text is bigger than the figma", "arrows not aligned").
argument-hint: "[page URL] [figma link] [selectors or section names]"
allowed-tools: mcp__figma__get_design_context, mcp__figma__get_metadata, mcp__figma__get_variable_defs, mcp__figma__get_screenshot, mcp__plugin_playwright_playwright__browser_navigate, mcp__plugin_playwright_playwright__browser_resize, mcp__plugin_playwright_playwright__browser_evaluate, mcp__plugin_playwright_playwright__browser_take_screenshot, mcp__plugin_playwright_playwright__browser_snapshot, mcp__plugin_playwright_playwright__browser_console_messages, mcp__plugin_playwright_playwright__browser_close, Read, Grep, Glob, Bash
---

# Design review

Measure the rendered page against its Figma source and report numbers.

Arguments given: $ARGUMENTS

Anything missing from those arguments, infer from this session: the page most
recently worked on, the Figma link already in context, the selectors just
touched. Ask only if the page URL cannot be determined.

## You report, you do not fix

Name the token or property at fault and stop. Do not edit files. The user reads
the table and decides.

## Measure, never eyeball

A screenshot hides geometry errors. Assert resolved values with
`browser_evaluate`, and batch every assertion into ONE call:

```js
() => {
  const r = {};
  const el = document.querySelector('.usp-bar');
  const cs = getComputedStyle(el);
  r.pad = cs.paddingBlock;
  r.bg = cs.backgroundColor;
  r.token = getComputedStyle(document.documentElement)
    .getPropertyValue('--usp-surface').trim();
  r.overflow = document.documentElement.scrollWidth <= window.innerWidth;
  return r;
}
```

One evaluate returning an object beats fifteen returning strings. That is the
single biggest lever on both accuracy and context. Never paste raw screenshots,
DOM snapshots, or full `getComputedStyle` dumps into your answer.

## The value trap

Compare colours and spacing against the **resolved token**, not the Figma
literal. Asserting the raw Figma hex passes only for the one brand the design
was drawn in. A token missing from another theme file surfaces as
`rgba(0, 0, 0, 0)` or inherited black, and that is exactly the bug worth
catching. If a Figma hex matches no existing token, say so and stop: that is a
question for the user, not a value to paste.

## Viewports

390 and 1440 at minimum, plus any breakpoint named in the arguments.

## Project facts

Read `~/.claude/project-docs/<org>-<repo>/CLAUDE.md` for the repo you are in,
deriving `<org>-<repo>` from the path `code/<org>/<repo>`. It names the review
URL, where tokens live, the breakpoints, and the rendering quirks that are not
bugs. Never assume a localhost port; the doc has it.

If you hit a durable rendering trap the doc does not cover, say so at the end of
your report so it can be added there. Do not add project facts to this file.

## Output

End with exactly this shape and nothing else. No preamble, no narration of what
you navigated to.

```
VERDICT: PASS | FAIL (n mismatches)

| # | Element | Property | Figma | Rendered | Status |
|---|---------|----------|-------|----------|--------|
| 1 | .usp-bar | padding-block | 32px | 24px | FAIL |

Viewports checked: 390, 1440
Overflow: none | <selector> overflows by Npx at 390
Console: clean | N errors (first: ...)
Likely cause: --usp-gap missing from theme-vsr.scss
```
