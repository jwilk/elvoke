#!/usr/bin/env perl

# Copyright © 2014-2019 Jakub Wilk <jwilk@jwilk.net>
# SPDX-License-Identifier: MIT

no lib '.';

use strict;
use warnings;

use v5.10;

use English qw(-no_match_vars);
use FindBin ();
use Test::More;

eval {
    require Perl::MinimumVersion;
} or do {
    plan skip_all => "cannot import Perl::MinimumVersion";
};

my $target = $ENV{ELVOKE_TEST_TARGET} // "$FindBin::Bin/../elvoke";
if ($target !~ m{/}) {
    eval {
        require File::Which;
    } or do {
        plan skip_all => "cannot import File::Which";
    };
    $target = File::Which::which($target);
}

note "test target = $target";

plan tests => 1;

my $mv = Perl::MinimumVersion->new($target) or die;
cmp_ok(
    $mv->minimum_explicit_version,
    'ge',
    $mv->minimum_syntax_version,
    'explicit version >= syntax version',
);

# vim:ts=4 sts=4 sw=4 et
