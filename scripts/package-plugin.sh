#!/usr/bin/env bash
set -euo pipefail

PLUGIN_SLUG="${PLUGIN_SLUG:-design-experiments}"
VERSION="${VERSION:-$(date +%Y%m%d%H%M%S)}"
OUTPUT_DIR="${OUTPUT_DIR:-dist}"
ZIP_PATH="${OUTPUT_DIR}/${PLUGIN_SLUG}-${VERSION}.zip"

mkdir -p "${OUTPUT_DIR}"

if command -v npm >/dev/null 2>&1; then
	echo "Installing dependencies and building assets..."
	npm ci
	npm run build
else
	echo "npm is not installed; skipping asset build." >&2
fi

TMP_DIR="$(mktemp -d)"
trap 'rm -rf "${TMP_DIR}"' EXIT

rsync -a ./ "${TMP_DIR}/${PLUGIN_SLUG}/" \
	--exclude '.git' \
	--exclude '.github' \
	--exclude 'node_modules' \
	--exclude 'dist' \
	--exclude 'scripts' \
	--exclude '*.log'

(
	cd "${TMP_DIR}"
	zip -rq "${OLDPWD}/${ZIP_PATH}" "${PLUGIN_SLUG}"
)

echo "Created ${ZIP_PATH}"
