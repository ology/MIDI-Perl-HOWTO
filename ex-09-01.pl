#!/usr/bin/env perl
use strict;
use warnings;

use MIDI::Util qw(setup_score);
use Music::Scales qw(get_scale_MIDI);
use Music::VoiceGen;

my @pitches = (
    get_scale_MIDI('C', 3, 'major'),
    get_scale_MIDI('C', 4, 'major'),
);

my $voice = Music::VoiceGen->new(
  pitches   => \@pitches,
  intervals => [qw(-4 -3 -2 -1 1 2 3 4)],
);

my $score = setup_score(bpm => 120);

for my $i (1 .. 8) {
  for my $n (1 .. 4) {
    my $pitch = $voice->rand;

    # Get a fluctuating volume between f and fff
    my $vol = 'v' . (96 + int(rand 32));

    if ($i % 2 == 0) {
      $score->n('qn', $pitch, $vol);
      $score->r('qn');
    }
    else {
      $score->n('hn', $pitch, $vol);
    }
  }
}

$score->write_score("$0.mid");
