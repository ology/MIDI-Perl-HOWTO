#!/usr/bin/env perl
use strict;
use warnings;

use Data::Dumper::Compact 'ddc';
#use MIDI::Simple;
use Music::Duration;

my %x = %MIDI::Simple::Length;

print ddc([ map { "$_ => $x{$_}" } sort { $x{$a} <=> $x{$b} } keys %x ]);
