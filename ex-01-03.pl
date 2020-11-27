#!/usr/bin/env perl
use strict;
use warnings;

use Data::Dumper::Compact 'ddc';

use MIDI::Util;

my $score = MIDI::Util::setup_score();

print ddc($score);
