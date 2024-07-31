#!/usr/bin/perl

#make a file DNA1.txt in the same directory as the program file
open(DATA,"+<DNA1.txt") or die "Couldn't open file DNA1.txt, $!";

#read and write both without truncating the file

$DNA=<DATA>;

#assign the data to $RNA variable
$RNA = $DNA;

#replace T with U as there is in RNA
$RNA =~s/T/U/g;

print "\nDNA:$DNA\nRNA:$RNA\n"; #printing in the terminal

print DATA "\n rna=$RNA";

close DATA;
