#!/usr/bin/env perl
use strict;
use warnings;

use MIDI::Util qw(setup_score set_chan_patch);

my $bpm = shift || 120;

my $score = setup_score(bpm => $bpm);

$score->synch(\&bass, \&treble);

$score->write_score("$0.mid");

sub bass {
  set_chan_patch($score, 0, 35);
  for my $note (qw(C3 F3 G3 C4)) {
    $score->n('hn', $note);
  }
}

sub treble {
  set_chan_patch($score, 1, 0);
  for my $note (qw(C4 D4 E4 F4)) {
    $score->n('qn', $note);
    $score->r('qn');
  }
}
