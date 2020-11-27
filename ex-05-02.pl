#!/usr/bin/env perl
use strict;
use warnings;

use Data::Dumper::Compact 'ddc';
use Music::Duration::Partition;

my $mdp = Music::Duration::Partition->new(
  size => 4,
  pool => [qw(hn dqn qn en)],
);

for my $i (1 .. 8) {
  my $motif = $mdp->motif;
  print ddc($motif);
}
