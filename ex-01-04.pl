#!/usr/bin/env perl
use strict;
use warnings;

use Data::Dumper::Compact qw(ddc);
use MIDI::Util qw(setup_score);

my $score = setup_score();

for my $note (qw(C4 D4 E4 F4)) {
  $score->n('qn', $note);
  $score->r('qn');
}

print ddc($score);

$score->write_score("$0.mid");
