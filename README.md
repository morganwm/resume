# Resume

A clean, maintainable Typst-based resume with modular structure and CI/CD pipeline.

## Structure

- `resume.typ` - Main entry point that imports templates and content
- `src/templates.typ` - Reusable template functions (header, section, job, etc.)
- `src/content.typ` - All resume content data (header info, work experience, education)
- `base/` - Original resume documents and text extracts

## Local Development

### Prerequisites

Install Typst:
- macOS: `brew install typst`
- Linux: See [Typst installation guide](https://typst.app/docs/getting-started/installation/)
- Windows: See [Typst installation guide](https://typst.app/docs/getting-started/installation/)

### Compile Resume

```bash
typst compile resume.typ resume.pdf
```

### Watch Mode (auto-compile on changes)

```bash
typst watch resume.typ resume.pdf
```

## Editing

- **Update content**: Edit `src/content.typ` - all resume data is stored here
- **Change styling**: Edit `src/templates.typ` - modify functions to adjust layout, fonts, spacing
- **Structure changes**: Edit `resume.typ` - change the order or add/remove sections

## CI/CD

The repository includes a GitHub Actions workflow (`.github/workflows/build-resume.yml`) that:

- Automatically compiles the resume on push to main/master
- Creates a PDF artifact that can be downloaded
- Creates a release with the PDF when you push a tag

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
