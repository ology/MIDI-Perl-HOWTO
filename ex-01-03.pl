#!/usr/bin/env perl
use strict;
use warnings;

use Data::Dumper::Compact 'ddc';
use MIDI::Util qw(setup_score);

my $score = setup_score();

print ddc($score);
