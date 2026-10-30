# Resume

[Download Latest Resume PDF](https://github.com/morganwm/resume/releases/latest/download/morgan_watson-morris_resume.pdf)

A clean, maintainable Typst-based resume with modular structure and CI/CD pipeline.

## Structure

- `resume.typ` - Main entry point that imports templates and content
- `src/templates.typ` - Reusable template functions and styling (page setup, header, job, project, etc.)
- `src/content.typ` - Header info, overview paragraphs, education, and the ordered `work-experience` list
- `src/experience/` - One file per role, each exporting that job's dictionary and its projects
- `fonts/` - TeX Gyre Heros (GUST Font License), committed so every build uses the same font

## Local Development

### Prerequisites

- [Typst](https://typst.app/docs/getting-started/installation/) 0.15.1 (the version CI pins)
- Optional: [just](https://github.com/casey/just) for the shortcuts below, and
  [typstyle](https://github.com/typstyle-rs/typstyle) for formatting

The devcontainer installs all of these and configures VS Code (Tinymist preview,
format on save).

Typst needs to find the committed fonts. Either pass `--font-path fonts` or set:

```bash
export TYPST_FONT_PATHS=fonts
```

### Compile Resume

```bash
just build
```

or directly:

```bash
typst compile resume.typ morgan_watson-morris_resume.pdf
```

### Compile-Time Inputs

| Input     | Default | Effect                                                     |
| --------- | ------- | ---------------------------------------------------------- |
| `company` | `base`  | Selects the overview paragraph (key of `overviews`)        |
| `phone`   | (none)  | Phone number in the contact line; omitted when not given   |
| `header`  | `true`  | `false` hides the contact block and running page header    |
| `footer`  | `true`  | `false` hides the page-number footer                       |

The phone number is not stored in the repo. Locally, set `RESUME_PHONE` and the
`just` recipes pass it through; CI reads the `RESUME_PHONE` repository secret.

### Company Variants

The overview paragraph can be swapped per company at compile time. The available
variants are the keys of the `overviews` dictionary in `src/content.typ`:

```bash
just build temporal
```

```bash
just all
```

To add a variant, add a key to `overviews`. CI reads the keys from that
dictionary, so the new variant is built automatically.

### Watch Mode (Auto-Compile on Changes)

```bash
just watch
```

### Formatting

Typst files are formatted with typstyle; CI fails if they aren't.

```bash
just fmt
```

## Editing

- **Update content**: Edit `src/content.typ`, or the role's file in `src/experience/`
- **Change styling**: Edit `src/templates.typ` - modify functions to adjust layout, fonts, spacing
- **Structure changes**: Edit `resume.typ` - change the order or add/remove sections

## CI/CD

The GitHub Actions workflow (`.github/workflows/build-resume.yml`):

- Checks formatting (typstyle) and spelling (typos)
- Compiles the resume (base + every company variant, one matrix job each) on pushes and pull requests to main/master
- Fails the build if the font can't be found, instead of silently using a fallback
- Publishes each PDF as its own workflow artifact (`resume-pdf-<company>`)
- Attaches all PDFs to a GitHub release when one is published (the download link above always points to the base resume)

### Manual Workflow Trigger

You can also manually trigger the workflow from the GitHub Actions tab.

### Creating a Release

PDFs are attached when a GitHub **release is published**. Pushing a tag on its own
does not trigger the workflow. Create the release from the GitHub UI, or:

```bash
gh release create v1.0.0 --title "Resume update" --notes ""
```
