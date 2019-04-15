#!/bin/sh

# Copyright © 2019 Jakub Wilk <jwilk@jwilk.net>
# SPDX-License-Identifier: MIT

set -e -u
echo 1..2
base="${0%/*}/.."
target="${ELVOKE_TEST_TARGET:-"$base/elvoke"}"
echo "# test target = $target"
cli_full_version=$("$target" --version)
read -r _ cli_version <<EOF
$cli_full_version
EOF
echo "# CLI version = $cli_version"
IFS='(); ' read -r _ changelog_version changelog_dist _ < "$base/doc/changelog"
echo "# changelog version = $changelog_version"
echo "# changelog dist = $changelog_dist"
[ "$cli_version" = "$changelog_version" ]
echo "ok 1 CLI version == changelog version"
if [ -d "$base/.git" ]
then
    echo 'ok 2 # skip git checkout'
else
    [ "$changelog_dist" != UNRELEASED ]
    echo 'ok 2 distribution != UNRELEASED'
fi

# vim:ts=4 sts=4 sw=4 et ft=sh
