#!perl

use strict;
use warnings;
use Test::More;
use Lingua::Stem::Ru qw(stem_word);

my $test_counter;

my @stem_words = (
	["гуля"	=> "гулял", "гуляла", "гуляли"],
	["ход"	=> "ходить", "ходил", "ходили"], 
	["езд"	=> "ездить", "езда", "езд"], 
);

test_stem_word(@{$_}) foreach @stem_words;

sub test_stem_word {

	my ($stem, @words) = @_;

	foreach my $word (@words) {

    		my $got_stem = stem_word($word);

		is ($got_stem, $stem, "Stem test for word: $word");
		$test_counter++;
	}
}

done_testing( $test_counter );
