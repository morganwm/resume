# Agent Instructions & Best Practices for Typst Resume

## Goal

Maintain a Typst resume where `src/content.typ` (plus the per-role files in `src/experience/`) is the source of truth and `src/templates.typ` defines the visual layout.

## Constraints

- **Content**: `src/content.typ` and `src/experience/*.typ` are authoritative. Preserve existing wording unless explicitly asked to rewrite; fix typos freely.
- **Style**: Keep the resume clean and consistent; prefer small, iterative layout changes.
- **Tooling**: Use `typst` CLI (version pinned in CI) to compile and verify; format with `typstyle -i .` before committing (CI runs `typstyle --check .`).

## Best Practices for Typst

- **Structure**: Use functions for repeated elements like job entries and education blocks. Template functions take named arguments matching the content dictionaries' keys, so entries are passed by spreading (`job(..job-data)`).
- **Sections**: Use level-1 headings (`= Work Experience`); their look comes from the `show heading` rule in `resume`.
- **Spacing**: Prefer `block(above:/below:)` over negative `v()` adjustments.
- **Styling**: Define a `resume` function that sets up the document properties (margins, fonts) and wraps the content.
- **Robustness**: Escape special characters if necessary (though Typst handles most well).
- **Iterative Development**: Compile often to ensure syntax is correct.

## Workflow

1. **Content**: Update resume data in `src/content.typ`; job entries and their projects live in `src/experience/<role>.typ`. To add a role, create its file, export a `#let` dictionary, import it by name (no `*`) in `src/content.typ`, and add it to the `work-experience` list, which sets the order on the page. Job files must not import `src/content.typ` (circular import).
2. **Templating**: Adjust layout/components in `src/templates.typ`.
3. **Composition**: Reorder/add sections in `resume.typ` as needed.
4. **Verification**: Compile and check for errors.

## Project Structure

- `resume.typ`: Main source file (entry point).
- `src/content.typ`: Resume content data (header, overviews, education) and the ordered `work-experience` list.
- `src/experience/`: One file per role, each exporting that job's dictionary and its projects.
- `src/templates.typ`: Visual styling and component functions.
- `fonts/`: Committed TeX Gyre Heros; builds must use it (`TYPST_FONT_PATHS=fonts` or `--font-path fonts`).
- `justfile`: Shortcuts for building, watching, and formatting.
- `AGENTS.md`: This file.

## Compilation

Run `typst compile resume.typ --font-path fonts` (or `just build`) to generate the PDF. A warning about an unknown font family means the font wasn't found; CI treats it as an error.

Company-specific variants swap only the overview paragraph: `typst compile resume.typ --input company=<key>`, where `<key>` is a key of the `overviews` dictionary in `src/content.typ` (defaults to `base`). CI reads the variant list from that dictionary, so no workflow change is needed to add one.

Other inputs: `header=false`, `footer=false`.
