#!/usr/bin/env perl
use strict;
use warnings;

use MIDI::Util qw(setup_score set_chan_patch);

my $score = setup_score();

$score->synch(\&bass, \&treble);

$score->write_score("$0.mid");

sub bass {
  set_chan_patch($score, 0, 35);
  for my $note (qw(C3 F3 G3 C4)) {
    $score->n('hn', $note, 'v127');
  }
}

sub treble {
  set_chan_patch($score, 1, 0);
  for my $note (qw(C4 D4 E4 F4)) {
    $score->n('qn', $note, 'v120');
    $score->r('qn');
  }
}
