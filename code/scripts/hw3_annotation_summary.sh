#!/bin/env/bash

# Homework 3: Annotation of Drosophila melanogaster genomes from FlyBase release 6.66

# working in the Flybase directory and activate mamba
mkdir -p ~/FlyBase
cd ~/FlyBase
mamba activate ee282

# downloading the gtf annotation file
$wget https://flybase.org/genomes/Drosophila_melanogaster/dmel_r6.66_FB2025_05/gtf/dmel-all-r6.66.gtf.gz

# downloading the official checksum file for gtf
$wget https://s3ftp.flybase.org/genomes/Drosophila_melanogaster/dmel_r6.66_FB2025_05/gtf/md5sum.txt -O gtf_md5sum.txt

#verifying file integrity
$md5sum -c gtf_md5sum.txt

# counting the total number of features of each type, from most to least common
$bioawk -c gff '{print $feature}' dmel-all-r6.66.gtf.gz | sort | uniq -c | sort -nr

# finding the total number of genes for each chromosome arm
$bioawk -c gff '$feature == "gene" && $seqname ~ /^(X|Y|2L|2R|3L|3R|4)$/ {print $seqname}' dmel-all-r6.66.gtf.gz | sort | uniq -c
