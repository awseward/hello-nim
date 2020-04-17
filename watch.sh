#!/usr/bin/env bash

set -euo pipefail

file="${1:-scratch.nim}"

echo "${file}" | entr nim c --outdir:bin/ -r "${file}"
