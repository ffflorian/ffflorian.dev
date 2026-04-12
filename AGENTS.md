# AGENTS.md

## Repository overview

- This repository contains the source for `ffflorian.dev`, a Hugo-based personal site.
- Main authoring areas:
  - `content/` for page content
  - `assets/` for CSS and icons
  - `layouts/` for Hugo layout overrides and partials
  - `static/` for files copied as-is to the built site
  - `config.toml` and `config/` for site configuration
- `public/` is generated output. Do not hand-edit generated files there unless the task is explicitly about build artifacts.

## Working rules

- Keep changes small and targeted. Prefer updating the relevant content, asset, or layout file instead of broad restructuring.
- Preserve the existing Hugo and Markdown conventions already used in the repository.
- When changing the site behavior, make the corresponding update in the most specific layer available:
  - content changes in `content/`
  - presentation changes in `assets/` or `layouts/`
  - static file additions in `static/`
- If you touch build or deployment behavior, keep `Dockerfile` and `.github/workflows/build_test_publish.yml` aligned.

## Local commands

- Start local development server: `hugo server`
- Build the site: `hugo --minify`
- Minimal validation used in CI:
  - `hugo --minify`
  - `test -f ./public/index.html`

## Commit messages

Use semantic commit messages following the Conventional Commits style:

- Format: `<type>(<scope>): <summary>`
- Use the imperative mood and keep the summary concise.
- Omit the scope when it does not add clarity.

Recommended types for this repository:

- `feat` for new site content or functionality
- `fix` for bug fixes
- `docs` for documentation-only changes
- `style` for visual or CSS-only adjustments
- `refactor` for internal template or structure cleanup without behavior change
- `build` for Docker or build pipeline changes
- `ci` for GitHub Actions changes
- `chore` for maintenance tasks

Examples:

- `feat(content): add new photography entry`
- `fix(layouts): correct social link rendering`
- `style(assets): adjust homepage spacing`
- `docs: add repository agent instructions`
- `ci(actions): align Hugo build workflow`

If a change is breaking, mark it with `!` in the header and describe the impact in the footer:

- `feat(config)!: rename primary site section`
- Footer: `BREAKING CHANGE: downstream links must use the new section path`

## Pull requests

- Open pull requests against `main`.
- Keep the PR title aligned with the semantic commit message when possible.
- In the PR description, summarize the user-visible change and note any build or deployment impact.
