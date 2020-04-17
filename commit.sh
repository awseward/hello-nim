#!/usr/bin/env bash

set -euo pipefail

git commit -p \
  && git push -u origin HEAD \
  && echo > scratch.nim \
  && git add scratch.nim
