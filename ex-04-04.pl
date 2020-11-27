#!/usr/bin/env perl
use strict;
use warnings;

use Music::Note;

my $note = Music::Note->new('C4', 'ISO');
print $note->format('midinum'), "\n";

$note = Music::Note->new(60, 'midinum');
print $note->format('ISO'), "\n";
