#!/usr/bin/perl
use strict;
use warnings;

# Define a hash table to map codons to amino acids
my %codon_table = (
    'TTT' => 'F', 'TTC' => 'F', 'TTA' => 'L', 'TTG' => 'L',
    'TCT' => 'S', 'TCC' => 'S', 'TCA' => 'S', 'TCG' => 'S',
    'TAT' => 'Y', 'TAC' => 'Y', 'TAA' => '*', 'TAG' => '*',
    'TGT' => 'C', 'TGC' => 'C', 'TGA' => '*', 'TGG' => 'W',
    'CTT' => 'L', 'CTC' => 'L', 'CTA' => 'L', 'CTG' => 'L',
    'CCT' => 'P', 'CCC' => 'P', 'CCA' => 'P', 'CCG' => 'P',
    'CAT' => 'H', 'CAC' => 'H', 'CAA' => 'Q', 'CAG' => 'Q',
    'CGT' => 'R', 'CGC' => 'R', 'CGA' => 'R', 'CGG' => 'R',
    'ATT' => 'I', 'ATC' => 'I', 'ATA' => 'I', 'ATG' => 'M',
    'ACT' => 'T', 'ACC' => 'T', 'ACA' => 'T', 'ACG' => 'T',
    'AAT' => 'N', 'AAC' => 'N', 'AAA' => 'K', 'AAG' => 'K',
    'AGT' => 'S', 'AGC' => 'S', 'AGA' => 'R', 'AGG' => 'R',
    'GTT' => 'V', 'GTC' => 'V', 'GTA' => 'V', 'GTG' => 'V',
    'GCT' => 'A', 'GCC' => 'A', 'GCA' => 'A', 'GCG' => 'A',
    'GAT' => 'D', 'GAC' => 'D', 'GAA' => 'E', 'GAG' => 'E',
    'GGT' => 'G', 'GGC' => 'G', 'GGA' => 'G', 'GGG' => 'G',
);

# Input DNA sequence
my $dna_sequence = "ATGGTCTACATAGCTGTAGGA";

# Perform translation
my $protein_sequence = translate_dna_to_protein($dna_sequence);

# Output the result
print "DNA Sequence: $dna_sequence\n";
print "Protein Sequence: $protein_sequence\n";

# Subroutine to perform translation
sub translate_dna_to_protein {
    my ($dna) = @_;
    my $protein = '';

    # Check if the length of the DNA sequence is a multiple of 3
    if (length($dna) % 3 == 0) {
        # Loop through the DNA sequence in steps of 3
        for (my $i = 0; $i < length($dna); $i += 3) {
            # Extract a codon
            my $codon = substr($dna, $i, 3);

            # Lookup the amino acid for the codon in the hash table
            my $amino_acid = $codon_table{$codon};

            # Append the amino acid to the protein sequence
            $protein .= $amino_acid;
        }
        #since triplets form amino acid
    } else {
        print "Warning: The length of the DNA sequence is not a multiple of 3.\n";
    }

    return $protein;
}
