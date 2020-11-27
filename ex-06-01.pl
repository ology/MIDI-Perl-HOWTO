#!/usr/bin/env perl
use strict;
use warnings;

use Data::Dumper::Compact 'ddc';

use MIDI::Drummer::Tiny;

my $d = MIDI::Drummer::Tiny->new;

print ddc($d);
