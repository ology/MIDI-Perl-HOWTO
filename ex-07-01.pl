#!/usr/bin/env perl
use strict;
use warnings;

use Data::Dumper::Compact qw(ddc);
use Music::Scales qw(get_scale_MIDI);
use Music::VoiceGen;

my @pitches = (
    get_scale_MIDI('C', 4, 'minor'),
    get_scale_MIDI('C', 5, 'minor'),
);

my $voice = Music::VoiceGen->new(
    pitches   => \@pitches,
    intervals => [qw(-4 -3 -2 -1 1 2 3 4)],
);

my @notes = map { $voice->rand } 1 .. 8;

print ddc(\@notes);
