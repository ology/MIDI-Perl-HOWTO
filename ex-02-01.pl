#!/usr/bin/env perl
use strict;
use warnings;

use MIDI::Util;

my $score = MIDI::Util::setup_score();

$score->synch(\&bass, \&treble);

$score->write_score("$0.mid");

sub bass {
  for my $n (qw(C3 F3 G3 C4)) {
    $score->n('hn', $n);
  }
}

sub treble {
  for my $note (qw(C4 D4 E4 F4)) {
    $score->n('qn', $note);
    $score->r('qn');
  }
}
