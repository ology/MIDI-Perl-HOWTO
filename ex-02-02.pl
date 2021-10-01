#!/usr/bin/env perl
use strict;
use warnings;

use MIDI::Util qw(setup_score);

my $score = setup_score();

$score->synch(
  sub { bass($score) },
  sub { treble($score) },
);

$score->write_score("$0.mid");

sub bass {
  my ($score) = @_;
  for my $note (qw(C3 F3 G3 C4)) {
    $score->n('hn', $note);
  }
}

sub treble {
  my ($score) = @_;
  for my $note (qw(C4 D4 E4 F4)) {
    $score->n('qn', $note);
    $score->r('qn');
  }
}
