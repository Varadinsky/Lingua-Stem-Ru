# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; }

use Lingua::Stem::Ru;
my $loaded = 1;

use strict;
use warnings;

my ($total_tests, $success_tests) = (1, 1);

######################### End of black magic.

# Insert your test code below (better if it prints "ok 13"
# (correspondingly "not ok 13") depending on the success of chunk 13
# of the test code):

sub test_stem {
    my ($t, $words, $expected) = @_;
    my @errors = ();
    my $stemmed_words = Lingua::Stem::Ru::stem( { -words => $words } );
    foreach my $stem (@$stemmed_words) {
        if($stem ne $expected) {
            push @errors, "\t# expected '$expected', got '$stem'\n";
        } else {
	    $success_tests++;
	}
        $total_tests++;
    }
    print "not ok ", @errors if @errors;
}

sub test_stem_word {
    my($t, $word, $expected) = @_;
    my $stem = Lingua::Stem::Ru::stem_word($word);
    if($stem ne $expected) {
        print "not ok\n\t# expected '$expected', got '$stem'\n";
    } else {
	$success_tests++;
    }
    $total_tests++;
}	



test_stem(2, ["гулял", "гуляла", "гуляли"], "гуля");
test_stem(3, ["ходить", "ходил", "ходили"], "ход");
test_stem(4, ["ездить", "езда", "езд"], "езд");

# sample stemmed lists
# from http://snowball.tartarus.org/russian/stemmer.html
my(@vocs, @output);
    
open(VOC, "voc.txt");
foreach(<VOC>) {
   chomp;
   push @vocs, $_;
}
close(VOC);

open(OUT, "output.txt");
foreach(<OUT>) {
   chomp;
   push @output, $_;
}
close(OUT);

for(0..$#vocs) {
    test_stem_word($_+2, $vocs[$_], $output[$_]);
}


printf "%d tests performed, %d failed, %d successfull\n",
    $total_tests, $total_tests-$success_tests, $success_tests;

END { print "not ok 1\n" unless $loaded; }
