#!/usr/bin/env perl
use strict;
use warnings;

use Data::Dumper::Compact 'ddc';

use MIDI::Util;

my $score = MIDI::Util::setup_score();

for my $note (qw(C4 D4 E4 F4)) {
  $score->n('qn', $note, 'v127');
  $score->r('qn');
}

print ddc($score);

$score->write_score("$0.mid");
