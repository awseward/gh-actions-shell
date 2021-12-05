#!/usr/bin/env bash

set -euo pipefail

# Follows a pattern from here that I really liked:
# https://web.archive.org/web/20211130220046/https://www.oilshell.org/blog/2021/08/xargs.html
#
# (look for `xargs Can Invoke Shell Functions With the $0 Dispatch Pattern`)

one() {
  echo "./files/$1"
}

many() {
  xargs -n 1 -d $'\n' -- "$0" one | sort -u
}

"$@"
