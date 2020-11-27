#!/usr/bin/env perl
use strict;
use warnings;

use MIDI::Util;

my $score = MIDI::Util::setup_score();

$score->synch(\&bass, \&treble);

$score->write_score("$0.mid");

sub bass {
  MIDI::Util::set_chan_patch($score, 0, 35);
  for my $n (1 .. 4) {
    $score->n('hn', 'C3', 'v127');
  }
}

sub treble {
  MIDI::Util::set_chan_patch($score, 1, 0);
  for my $note (qw(C4 D4 E4 F4)) {
    $score->n('qn', $note, 'v127');
    $score->r('qn');
  }
}
