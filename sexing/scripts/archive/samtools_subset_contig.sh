#!/bin/bash
#SBATCH --job-name=subset_bam          # Job name
#SBATCH --output=subset_bam.%j.out     # Standard output log (%j expands to job ID)
#SBATCH --error=subset_bam.%j.err      # Standard error log
#SBATCH --time=04:00:00                # Walltime (max 4 hours)
#SBATCH --cpus-per-task=4              # Number of CPU cores
#SBATCH --mem=16G                      # Memory per node

# Load required modules (if installed as module, adjust if needed)
# module load apps/subset-bam/1.1.0


# Input/output paths (replace with your files)
BAM_FILE=$1
CONTIG=$2
OUT_BAM=${2}_${1}

# Optional: set TMPDIR if $TMPDIR is not large enough
# export TMPDIR=/scratch/$USER/tmp

module load SAMtools/1.9-foss-2018b

# Run subset-bam
samtools view -bh $BAM_FILE $CONTIG > $OUT_BAM
