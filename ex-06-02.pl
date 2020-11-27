#!/usr/bin/env perl
use strict;
use warnings;

use MIDI::Drummer::Tiny;

my $d = MIDI::Drummer::Tiny->new;

$d->count_in(4);  # Closed hi-hat for 4 bars

$d->write;
