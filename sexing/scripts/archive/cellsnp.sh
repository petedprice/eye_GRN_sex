#!/bin/bash
#SBATCH --job-name=subset_bam          # Job name
#SBATCH --output=/mnt/parscratch/users/bi1pp/work/cellsnp.%j.out     # Standard output log (%j expands to job ID)
#SBATCH --error=/mnt/parscratch/users/bi1pp/work/cellsnp.%j.err      # Standard error log
#SBATCH --time=04:00:00                # Walltime (max 4 hours)
#SBATCH --cpus-per-task=4              # Number of CPU cores
#SBATCH --mem=64G                      # Memory per node

# Load required modules (if installed as module, adjust if needed)
# module load apps/subset-bam/1.1.0


# Input/output paths (replace with your files)
BAM_FILE=$1
BARCODES=$2
OUT_DIR=$3
CONTIG=$4
# Optional: set TMPDIR if $TMPDIR is not large enough
# export TMPDIR=/scratch/$USER/tmp

module load Anaconda3/2024.02-1

source activate cellsnp

# Run subset-bam
cellsnp-lite \
	-s $BAM_FILE \
	-b $BARCODES \
	-O $OUT_DIR \
	--chrom $CONTIG \
	-p 10 --minMAF 0.1 --minCOUNT 10 --gzip
	
