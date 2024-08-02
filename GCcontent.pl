#!/usr/bin/perl
use strict;
use warnings;

# Calculate GC content of a DNA sequence
sub gc_content {
    my $seq = shift;
    my $gc_count = ($seq =~ tr/GCgc//);
    return ($gc_count / length($seq)) * 100;
}

# Read sequence from input
my $sequence = "AGCTGCGCGCGTACGTAGCTAGCTAGCG";

# Calculate and print GC content
my $gc = gc_content($sequence);
print "GC Content: $gc%\n";
