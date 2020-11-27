#!/usr/bin/env perl
use strict;
use warnings;

use Data::Dumper::Compact 'ddc';
use MIDI::Util;
use Music::Chord::Note;

my $score = MIDI::Util::setup_score();

my $mcn = Music::Chord::Note->new;

for my $c (qw(Cm7 F7 BbM7 EbM7 Adim7 D7 Gm)) {
  my @chord = $mcn->chord($c);

  @chord = MIDI::Util::midi_format(@chord);
  print ddc(\@chord);

  $score->n('wn', @chord);
}

$score->write_score("$0.mid");
