# Agent Instructions & Best Practices for Typst Resume

## Goal

Create a Typst resume mirroring `Morgan Watson-Morris - Resume as of 11-06-2024.pdf`.

## Constraints

- **Content**: Exact wording for experience is required. Only typos should be fixed.
- **Style**: Match the visual style of the original PDF (layout, fonts, spacing).
- **Tooling**: Use `typst` CLI to compile and verify.

## Best Practices for Typst

- **Structure**: Use functions for repeated elements like job entries, education blocks, and section headers.
- **Styling**: Define a `resume` function that sets up the document properties (margins, fonts) and wraps the content.
- **Robustness**: Escape special characters if necessary (though Typst handles most well).
- **Iterative Development**: Compile often to ensure syntax is correct.

## Workflow

1. **Extraction**: Get the raw text from the PDF to ensure accuracy.
2. **Templating**: Create the visual structure in Typst.
3. **Population**: Fill in the content.
4. **Verification**: Compile and check for errors.

## Project Structure

- `resume.typ`: Main source file (entry point).
- `src/content.typ`: Resume content data.
- `src/templates.typ`: Visual styling and component functions.
- `base/`: Directory containing original resume files and extracted text.
- `AGENTS.md`: This file.

## Compilation

Run `typst compile resume.typ` to generate the PDF.
