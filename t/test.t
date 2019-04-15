#!/bin/sh

# Copyright © 2014-2019 Jakub Wilk <jwilk@jwilk.net>
# SPDX-License-Identifier: MIT

set -e -u
echo 1..3
base="${0%/*}/.."
target="${ELVOKE_TEST_TARGET:-"$base/elvoke"}"
echo "# test target = $target"
tmpdir=$(mktemp -d -t elvoke.XXXXXX)
export ELVOKE_HOME="$tmpdir"
out=$("$target" -t 2s echo foo)
if [ "$out" = foo ]
then
    echo ok 1
else
    echo not ok 1
fi
out=$("$target" -t 2s echo foo)
if [ -z "$out" ]
then
    echo ok 2
else
    echo not ok 2
fi
sleep 3
out=$("$target" -t 2s echo foo)
if [ "$out" = foo ]
then
    echo ok 3
else
    echo not ok 3
fi

rm -rf "$tmpdir"

# vim:ts=4 sts=4 sw=4 et ft=sh
