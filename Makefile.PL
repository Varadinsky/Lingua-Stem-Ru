use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    'NAME'		=> 'Lingua::Stem::Ru',
    'VERSION_FROM'	=> 'Ru.pm', # finds $VERSION
    'PREREQ_PM'		=> {}, # e.g., Module::Name => 1.1
    ($] < 5.005 ? () : (
		'AUTHOR'        	=> 'Aleksandr Guidrevitch <pillgrim@mail.ru>',
		'ABSTRACT'      	=> 'Porter\'s stemming algorithm for Russian',
    )),
);
