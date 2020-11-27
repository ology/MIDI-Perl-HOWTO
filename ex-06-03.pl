#!/usr/bin/env perl
use strict;
use warnings;

use MIDI::Drummer::Tiny;

my $d = MIDI::Drummer::Tiny->new(bars => 8);

$d->metronome44; # 4/4 time for the number of bars

$d->write;
