# Homework 3: Summarizing Genome Assemblies and Annotation Files
**Khyati Kamble**

## Genome Assembly Summary
I downloaded the *Drosophila melanogaster* genome assembly gzipped FASTA file from FlyBase (release 6.66) and contained all chromosomes. The downloaded file had the name " dmel-all-chromosome-r6.66.fasta.gz ".

` drosophila_genome=https://flybase.org/genomes/\
Drosophila_melanogaster/dmel_r6.66_FB2025_05/fasta/\
dmel-all-chromosome-r6.66.fasta.gz \
$wget $drosophila_genome -O FlyBase_r6-66_chr.fasta.gz `

### File Integrity
In order to make sure that we will be analyzing what we want to analyze, we will run a checksum to ensure that the file is not corrupted.

`$checksum=https://flybase.org/genomes/Drosophila_melanogaster/dmel_r6.66_FB2025_05/fasta/md5sum.txt\
$wget $checksum\
$grep 'dmel-all-chromosome-r6.66.fasta.gz' md5sum.txt | md5sum -c`

The md5sum returned the following 40 digit hexadecimal value: **ea600dbb86f1779463f69082131753cd**
### Calculating Genome Assembly Statistics
A really nice way to get a summary of the genome is to use `faSize`, which will provide us with the total number of nucleotides, Ns, and sequences.

`faSize FlyBase_r6-66_chr.fasta.gz`

#### Outcome
143726002 bases (1152978 N's 142573024 real 142573024 upper 0 lower) in 1870 sequences in 1 files
Total size: mean 76858.8 sd 1382100.2 min 544 (211000022279089) max 32079331 (3R) median 1577
N count: mean 616.6 sd 6960.7
U count: mean 76242.3 sd 1379508.4
L count: mean 0.0 sd 0.0
%0.00 masked total, %0.00 masked real

So to summarize this result,
Total number of nucleotides: 143726002
Total number of Ns: 1152978
Total number of sequences: 1870

## Annotation File Summary
Similar to the files above, I downloaded the *Drosophila melanogaster* annotation gzipped GTF file from FlyBase (release 6.66) and contained all chromosomes. The downloaded file had the name " dmel-all-r6.66.gz ".

`$wget https://flybase.org/genomes/Drosophila_melanogaster/dmel_r6.66_FB2025_05/gtf/dmel-all-r6.66.gtf.gz
`
### File Integrity
Likewise, we will doublecheck the md5sum of this.

`$wget https://s3ftp.flybase.org/genomes/Drosophila_melanogaster/dmel_r6.66_FB2025_05/gtf/md5sum.txt -O gtf_md5sum.txt\
$md5sum -c gtf_md5sum.txt`

### The Total Number of Features of Each Type
Annotations provide us a lot of information about the type of features found in genomes. The following is a way to understand the total number of features of each type, sorted from most to least common.

`$bioawk -c gff '{print $feature}' dmel-all-r6.66.gtf.gz | sort | uniq -c | sort -nr`

**Remember to activate mamba for this command**
`mamba activate ee282`

#### Outcome
 190176 exon
 163377 CDS
  46856 5UTR
  33778 3UTR
  30922 start_codon
  30862 stop_codon
  30836 mRNA
  17872 gene
   3059 ncRNA
    485 miRNA
    365 pseudogene
    312 tRNA
    270 snoRNA
    262 pre_miRNA
    115 rRNA
     32 snRNA
 This is the total number of each of the features indicated beside it.

### The Total Number of Genes per Chromosome Arm
Identifying the number of genes in each arm of a chromosome can provide useful information. To do this, execute the following command.

`$bioawk -c gff '$feature == "gene" && $seqname ~ /^(X|Y|2L|2R|3L|3R|4)$/ {print $seqname}' dmel-all-r6.66.gtf.gz | sort | uniq -c`

#### Outcome
   3508 2L
   3649 2R
   3481 3L
   4226 3R
    114 4
   2704 X
    113 Y
The numbers above represent the number of genes in the chromosome arm indicated next to it.


