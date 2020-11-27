#!/usr/bin/env perl
use strict;
use warnings;

use Data::Dumper::Compact 'ddc';
use Music::Chord::Positions;
use Music::Note;

my $mcp = Music::Chord::Positions->new;

my $inversion = shift || 1;

my $chord = [qw(C E G)];
print 'Chord: ', ddc($chord);

my @pitches = map { Music::Note->new($_ . -1, 'ISO')->format('midinum') } @$chord;
print 'Pitches: ', ddc(\@pitches);

my $inverted = $mcp->chord_inv(\@pitches, inv_num => $inversion);
print 'Inverted: ', ddc($inverted);

my @notes = map { Music::Note->new($_, 'midinum')->format('isobase') } @$inverted;
print 'New: ', ddc(\@notes);
