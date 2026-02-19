# Agent Instructions & Best Practices for Typst Resume

## Goal

Maintain a Typst resume where `src/content.typ` is the source of truth and `src/templates.typ` defines the visual layout.

## Constraints

- **Content**: `src/content.typ` is authoritative. Preserve existing wording unless explicitly asked to rewrite; fix typos freely.
- **Style**: Keep the resume clean and consistent; prefer small, iterative layout changes.
- **Tooling**: Use `typst` CLI to compile and verify.

## Best Practices for Typst

- **Structure**: Use functions for repeated elements like job entries, education blocks, and section headers.
- **Styling**: Define a `resume` function that sets up the document properties (margins, fonts) and wraps the content.
- **Robustness**: Escape special characters if necessary (though Typst handles most well).
- **Iterative Development**: Compile often to ensure syntax is correct.

## Workflow

1. **Content**: Update resume data in `src/content.typ`.
2. **Templating**: Adjust layout/components in `src/templates.typ`.
3. **Composition**: Reorder/add sections in `resume.typ` as needed.
4. **Verification**: Compile and check for errors.

## Project Structure

- `resume.typ`: Main source file (entry point).
- `src/content.typ`: Resume content data.
- `src/templates.typ`: Visual styling and component functions.
- `AGENTS.md`: This file.

## Compilation

Run `typst compile resume.typ` to generate the PDF.
