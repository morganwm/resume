# Resume

[Download Latest Resume PDF](https://github.com/morganwm/resume/releases/latest/download/morgan_watson-morris_resume.pdf)

A clean, maintainable Typst-based resume with modular structure and CI/CD pipeline.

## Structure

- `resume.typ` - Main entry point that imports templates and content
- `src/templates.typ` - Reusable template functions (header, section, job, etc.)
- `src/content.typ` - All resume content data (header info, work experience, education)

## Local Development

### Prerequisites

Install Typst:

- macOS: `brew install typst`
- Linux: See [Typst installation guide](https://typst.app/docs/getting-started/installation/)
- Windows: See [Typst installation guide](https://typst.app/docs/getting-started/installation/)

### Compile Resume

```bash
typst compile resume.typ morgan_watson-morris_resume.pdf
```

### Company Variants

The overview paragraph can be swapped per company at compile time. The available
variants are the keys of the `overviews` dictionary in `src/content.typ`:

```bash
typst compile resume.typ morgan_watson-morris_resume_temporal.pdf --input company=temporal
```

Omitting `--input company=...` builds the generic (`base`) resume. To add a
variant, add a key to `overviews` and (to get it built in CI) add it to the
`VARIANTS` list in `.github/workflows/build-resume.yml`.

### Watch Mode (Auto-Compile on Changes)

```bash
typst watch resume.typ morgan_watson-morris_resume.pdf
```

## Editing

- **Update content**: Edit `src/content.typ` - all resume data is stored here
- **Change styling**: Edit `src/templates.typ` - modify functions to adjust lay out, fonts, spacing
- **Structure changes**: Edit `resume.typ` - change the order or add/remove sections

## CI/CD

The repository includes a GitHub Actions workflow (`.github/workflows/build-resume.yml`) that:

- Automatically compiles the resume (base + all company variants) on push to main/master
- Publishes all PDFs as a workflow artifact that can be downloaded
- Attaches all PDFs to the release when you push a tag (the download link above always points to the base resume)

### Manual Workflow Trigger

You can also manually trigger the workflow from the GitHub Actions tab.

### Creating a Release

To create a release with the compiled PDF:

```bash
git tag -a v1.0.0 -m "Resume update"
git push origin v1.0.0
```

## File Organization

The modular structure makes it easy to:

- Update content without touching templates
- Adjust styling without modifying content
- Add new sections or reorganize the resume
- Maintain version control with clear diffs
