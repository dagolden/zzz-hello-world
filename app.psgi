use strict;
use warnings;
use ZZZ::Hello::World;
my $app = sub { ZZZ::Hello::World->run_psgi(@_) };
