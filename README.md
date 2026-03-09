# Personal Site

A personal website built with [MkDocs Material](https://squidfunk.github.io/mkdocs-material/), managed with [uv](https://docs.astral.sh/uv/).

## Quick Start

### Prerequisites

- [uv](https://docs.astral.sh/uv/) - Fast Python package installer and resolver
- Optional: [just](https://github.com/casey/just) - Command runner (recommended)

### Setup

Clone the repository and sync dependencies:

```bash
git clone https://github.com/canavandl/canavandl.github.io.git
cd canavandl.github.io
uv sync
```

## Development

### Using uv

Preview the site locally:
```bash
uv run mkdocs serve
```

Build the site:
```bash
uv run mkdocs build
```

Deploy to GitHub Pages:
```bash
uv run mkdocs gh-deploy
```

### Using just (recommended)

If you have [just](https://github.com/casey/just) installed:

```bash
just serve    # Preview locally at http://127.0.0.1:8000
just build    # Build the site
just deploy   # Deploy to GitHub Pages
just clean    # Clean the site directory
```

## Project Structure

```
.
├── docs/           # Markdown content
│   ├── index.md    # Homepage
│   └── about.md    # About page
├── mkdocs.yml      # MkDocs configuration
├── pyproject.toml  # uv project configuration
├── uv.lock         # Locked dependencies
└── justfile        # Command shortcuts
```

## Adding Content

1. Create new Markdown files in the `docs/` directory
2. Update the `nav` section in `mkdocs.yml` to add them to navigation
3. Preview changes with `uv run mkdocs serve`
4. Deploy with `uv run mkdocs gh-deploy`

## Dependencies

Dependencies are managed by uv and defined in `pyproject.toml`:

- **mkdocs-material** - Material theme for MkDocs

### Adding Dependencies

```bash
uv add <package-name>
```

### Updating Dependencies

```bash
uv lock --upgrade
```

## Deployment

The site is deployed to GitHub Pages using the `gh-pages` branch:

```bash
uv run mkdocs gh-deploy
```

This command:
1. Builds the site
2. Pushes the built site to the `gh-pages` branch
3. GitHub Pages automatically serves it at https://canavandl.github.io/

## Branches

- **`master`** - Source files (docs, mkdocs.yml, etc.)
- **`gh-pages`** - Built site (auto-generated, don't edit directly)
- **`archive`** - Previous site version (for reference)

## Resources

- [MkDocs Material Documentation](https://squidfunk.github.io/mkdocs-material/)
- [uv Documentation](https://docs.astral.sh/uv/)
- [MkDocs Documentation](https://www.mkdocs.org/)
