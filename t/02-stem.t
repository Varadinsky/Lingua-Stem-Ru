#!perl

use strict;
use warnings;
use Test::More tests => 1;
use Lingua::Stem::Ru qw(stem);

my $diag  = qq(Words are taken from vocabulary file: "t/voc.txt" and their stemmed equivalent from: "t/output.txt" );

my @words = words_from_file('t/voc.txt');
my @stems = words_from_file('t/output.txt');

test_stem(\@words, \@stems, $diag);

sub words_from_file {
	my ($file) = @_;
	open (my $fh,'<',$file) or die($!);
	my @rows = map {chomp; $_} <$fh>;
	$fh->close();
	return @rows;
}

sub test_stem {

	my ($words, $stems, $diag) = @_;

	my $stems_got = stem( { -words => $words } );
	
	diag $diag;
	is_deeply ( $stems_got, $stems, "stem test" );

}

done_testing();
