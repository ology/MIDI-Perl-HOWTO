#!/usr/bin/env perl
use strict;
use warnings;

use Data::Dumper::Compact 'ddc';
use Music::Chord::Positions;
use Music::Note;

my $mcp = Music::Chord::Positions->new;

my $inversion = shift || 1; # Or 2

# Define the initial chord
my @chord = qw(C4 E4 G4);
print 'Chord: ', ddc(\@chord);

# Get the list of octaves for each note
my @octaves = map { s/[A-G]//r } @chord;
print 'Octaves: ', ddc(\@octaves);

# Get the list of note names without octaves
my @isobase = map { s/\d//r } @chord;
print 'ISObase: ', ddc(\@isobase);

# Get the pitch class
my @pitches = map { Music::Note->new($_ . -1, 'ISO')->format('midinum') } @isobase;
print 'Pitches: ', ddc(\@pitches);

# Invert the pitches
my $inverted = $mcp->chord_inv(\@pitches, inv_num => $inversion);
print 'Inverted: ', ddc($inverted);

# Convert the inverted pitches back to named notes
my @notes = map { Music::Note->new($_, 'midinum')->format('ISO') } @$inverted;
print 'New: ', ddc(\@notes);

# Clean-up the new chord notes
for my $i (0 .. $#notes) {
    $notes[$i] =~ s/-1/$octaves[$i]/;
    $notes[$i] =~ s/0/$octaves[$i] + 1/e;
}
print 'Fixed: ', ddc(\@notes);
