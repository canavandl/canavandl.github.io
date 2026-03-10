# Build the site
build:
    uv run mkdocs build

# Serve the site locally
serve:
    uv run mkdocs serve --watch-theme --watch docs

# Deploy to GitHub Pages
deploy:
    uv run mkdocs gh-deploy

# Clean the site directory
clean:
    rm -rf site/
