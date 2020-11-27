#!/usr/bin/env perl
use strict;
use warnings;

use Data::Dumper::Compact 'ddc';

my $data = {
  abc => 123,
  xyz => ['a', 42],
};

print ddc($data);
