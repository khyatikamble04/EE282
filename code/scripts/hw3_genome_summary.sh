#!/bin/env/bash

# Homework 3: Drosophila melanogaster genome assembly using data from FlyBase release 6.66

# create a directory for the downloaded data
dldir=~/FlyBase
mkdir -p $dldir
cd $dldir

# downloading the genome fasta file
drosophila_genome=https://s3ftp.flybase.org/genomes/\
Drosophila_melanogaster/dmel_r6.66_FB2025_05/fasta/\
dmel-all-chromosome-r6.66.fasta.gz
wget $drosophila_genome -O dmel-all-chromosome-r6.66.fasta.gz

# downloading the FlyBase checksum file for the fasta format
checksum=https://s3ftp.flybase.org/genomes/Drosophila_melanogaster/dmel_r6.66_FB2025_05/fasta/md5sum.txt
wget $checksum -O fasta_md5sum.txt

# verifying file integrity using checksums
grep 'dmel-all-chromosome-r6.66.fasta.gz' fasta_md5sum.txt | md5sum -c

# calculate genome assembly statistics (summaries of the total number of nucleotides, Ns, and sequences)
faSize dmel-all-chromosome-r6.66.fasta.gz
