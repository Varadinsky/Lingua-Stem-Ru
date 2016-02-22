#!perl -T
use strict;
use warnings;
use Test::More;

plan tests => 1;

BEGIN {
	use_ok( 'Lingua::Stem::Ru' ) || print "Bail out!\n";
}

