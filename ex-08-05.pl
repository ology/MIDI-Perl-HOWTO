#!/usr/bin/env perl
use strict;
use warnings;

use MIDI::Util;
use Music::Scales qw(get_scale_notes);
use Music::Chord::Note;
use Graph::Directed;

my $note = shift || 'C';
my $max  = shift || 8;

my $g = Graph::Directed->new;

# Set our chord progression map
my $progression = {
    1 => [qw(1 2 3 4 5 6)],
    2 => [qw(3 5)],
    3 => [qw(2 4 6)],
    4 => [qw(1 2 3 5)],
    5 => [qw(1)],
    6 => [qw(2 4)],
};

# Build the graph
for my $posn (keys %$progression) {
    for my $p ($progression->{$posn}->@*) {
        $g->add_edge($posn, $p);
    }
}

# Create a random progression
my @progression;
my $v = 1;
push @progression, $v;
for my $n (1 .. $max) {
    $v = $g->random_successor($v);
    push @progression, $v;
}
print "@progression\n";

my @scale = get_scale_notes($note);

# Set the major/minor parts of each scale position
my @valence = ('', 'm', 'm', '', '', 'm');

# Create a phrase that can be read by MIDI-Perl
my @phrase = map { $scale[$_ - 1] . $valence[$_ - 1] } @progression;
print "@phrase\n";

my $cn = Music::Chord::Note->new;

# Add octaves to the chord notes
my @notes;
for my $chord (@phrase) {
    my @chord = $cn->chord_with_octave($chord, 4);
    push @notes, \@chord;
}
#use Data::Dumper::Compact 'ddc';
#warn(__PACKAGE__,' ',__LINE__," MARK: ",ddc(\@notes));

my $score = MIDI::Util::setup_score();

# Add the notes to the score
$score->n('wn', @$_) for @notes;

#$score->n('wn', $cn->chord_with_octave('C', 4));

$score->write_score("$0.mid");
