#!/usr/bin/env bash

set -euo pipefail

entrypoint="${1:-scratch.nim}"

files_to_watch() { find . -type f -name '*.nim'; }
watch_build_run() { entr nim c --outdir:bin/ -r "${entrypoint}"; }

files_to_watch | watch_build_run
