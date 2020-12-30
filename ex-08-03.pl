#!/usr/bin/env perl
use strict;
use warnings;

use MIDI::Util;
use Music::Scales qw(get_scale_MIDI);

my @pitches = (
    get_scale_MIDI('C', 3, 'major'),
    get_scale_MIDI('C', 4, 'major'),
);

my $score = MIDI::Util::setup_score();

$score->synch(
  sub { dyads($score, \@pitches) },
  sub { single_note($score, \@pitches) },
);

$score->write_score("$0.mid");

sub single_note {
  my ($s, $pitches) = @_;
  for my $i (1 .. 8) {
    for my $n (1 .. 4) {
      my $pitch = $pitches->[rand int @$pitches];
      $s->n('qn', $pitch);
    }
  }
}

sub dyads {
  my ($s, $pitches) = @_;
  for my $i (1 .. 8) {
    my $pitch = $pitches->[rand int @$pitches];
    $s->n('wn', $pitch, $pitch + 7);
  }
}
