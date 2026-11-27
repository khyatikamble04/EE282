
# Homework 4: Genome Partition Plots

# Importing sequence lengths and gc content csv files from the hw4_genome_assembly.sh script
library(ggplot2)

small <- read.csv("~/FlyBaseHW4/small_sequences_stats.csv")
large <- read.csv("~/FlyBaseHW4/large_sequences_stats.csv")

# plotting sequence lengths in a histogram

ggplot(small, aes(x=Length)) + geom_histogram(bins = 30, fill = "blue", color = "black") +
	scale_x_log10() +
	labs(title = "Sequence Lengths Distribution for Sequences <= 100 kb", 
	     x = "Sequence Length (bp)"
	     y = "Frequency")
ggsave(
