#!/bin/sh
# Install the CLI tools the justfile uses (typstyle, just).
set -eu

# Keep in sync with TYPSTYLE_VERSION in .github/workflows/build-resume.yml
TYPSTYLE_VERSION=0.15.2

if command -v apk >/dev/null 2>&1; then
  sudo apk add --no-cache curl just
elif command -v apt-get >/dev/null 2>&1; then
  sudo apt-get update && sudo apt-get install -y curl just
fi

# The typst image is Alpine (musl). typstyle only publishes a musl build for
# x86_64; elsewhere, format-on-save still works through Tinymist's bundled copy.
if curl -sSL --fail -o /tmp/typstyle \
  "https://github.com/typstyle-rs/typstyle/releases/download/v${TYPSTYLE_VERSION}/typstyle-$(uname -m)-unknown-linux-musl"; then
  sudo install -m 755 /tmp/typstyle /usr/local/bin/typstyle
  rm /tmp/typstyle
else
  echo "No typstyle CLI build for $(uname -m) musl; skipping (Tinymist still formats on save)."
fi
