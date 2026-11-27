#!/usr/bin/env/bash

# Homework 4: Summarizing Partitions of a Drosophila melanogaster Genome Assembly

# create directory for the downloaded data 

dldir4=~/FlyBaseHW4
mkdir -p  $dldir4
cd $dldir4

# downloading the most recent Drosophila genome (r6.69) from FlyBase
wget "https://flybase.org/genomes/Drosophila_melanogaster/dmel_r6.69_FB2026_03/fasta/dmel-all-chromosome-r6.69.fasta.gz"
gunzip dmel-all-chromosome-r6.69.fasta.gz

# partition the genome into two parts: one with sequences less than and including 100 kb and one with sequences larger than 100 kb
bioawk -c fastx 'length($seq) <= 100000 {print ">"$name; print $seq}' dmel-all-chromosome-r6.69.fasta > small_sequences.fasta
bioawk -c fastx 'length($seq) > 100000 {print ">"$name; print $seq}' dmel-all-chromosome-r6.69.fasta > large_sequences.fasta

# summarize the two partitions of sequences
faSize small_sequences.fasta
faSize large_sequences.fasta

# calculate the lengths and gc content of the sequences and transfer it into a csv file for R later
bioawk -c fastx 'BEGIN {print "Sequence,Length,GC"} {print $name "," length($seq) "," gc($seq)*100}' small_sequences.fasta > small_sequences_stats.csv
bioawk -c fastx 'BEGIN {print "Sequence,Length,GC"} {print $name "," length($seq) "," gc($seq)*100}' large_sequences.fasta > large_sequences_stats.csv

