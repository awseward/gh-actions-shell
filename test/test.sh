#!/usr/bin/env bash

set -euo pipefail

# shellcheck disable=SC1091
source ../bin/_shellcheck > /dev/null 2>&1 || true

expected_output_file="$(mktemp)"; readonly expected_output_file
actual_output_file="$(mktemp)"; readonly actual_output_file

echo 'output files:'
echo "  expected_output_file='${expected_output_file}'"
echo "  actual_output_file='${actual_output_file}'"
echo

./gen_expected.sh many < data/expected_matches.txt > "${expected_output_file}"
( cd data &&  _list_files | xargs -n1 | sort -u > "${actual_output_file}" )
chmod -w "${expected_output_file}" "${actual_output_file}"

# Check for mismatch…
if [ "$(comm -3 "${expected_output_file}" "${actual_output_file}" | wc -l)" -gt 0 ]; then
  echo "${actual_output_file}" | xargs -t comm "${expected_output_file}" | sed -e 's/^ \+/\t/g'
  echo $'\nERROR: Mismatches present!'
  exit 1
fi

echo 'OK'
