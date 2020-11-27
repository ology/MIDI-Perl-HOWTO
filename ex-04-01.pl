#!/usr/bin/env perl
use strict;
use warnings;

use MIDI::Util;

my $score = MIDI::Util::setup_score(bpm => 120, volume => 120);

$score->synch(\&bass, \&treble);

$score->write_score("$0.mid");

sub bass {
  MIDI::Util::set_chan_patch($score, 0, 35);
  for my $n (1 .. 4) {
    $score->n('hn', 'C3');
  }
}

sub treble {
  MIDI::Util::set_chan_patch($score, 1, 0);

  my @pitches = (60, 62, 64, 65, 67, 69, 71, 72);

  for my $note (1 .. 4) {
    my $pitch = $pitches[int rand @pitches];
    $score->n('qn', $pitch);
    $score->r('qn');
  }
}
