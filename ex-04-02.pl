#!/usr/bin/env perl
use strict;
use warnings;

use MIDI::Util;
use Music::Scales qw(get_scale_MIDI);

my $score = MIDI::Util::setup_score(bpm => 120, volume => 120);

$score->synch(\&bass, \&treble);

$score->write_score("$0.mid");

sub bass {
  MIDI::Util::set_chan_patch($score, 0, 35);

  my @pitches = get_scale_MIDI('C', 2, 'pentatonic');

  for my $n (1 .. 4) {
    my $pitch = $pitches[int rand @pitches];
    $score->n('hn', $pitch);
  }
}

sub treble {
  MIDI::Util::set_chan_patch($score, 1, 0);

  my @pitches = get_scale_MIDI('C', 4, 'major');

  for my $n (1 .. 4) {
    my $pitch = $pitches[int rand @pitches];
    $score->n('qn', $pitch);
    $score->r('qn');
  }
}
