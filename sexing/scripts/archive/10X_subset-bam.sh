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
BARCODES=$2
OUT_BAM=$3

# Optional: set TMPDIR if $TMPDIR is not large enough
# export TMPDIR=/scratch/$USER/tmp
conda init

module load Anaconda3/2024.02-1

conda init

source activate subset-bam

# Run subset-bam
subset-bam \
    --bam $BAM_FILE \
    --cell-barcodes $BARCODES \
    --out-bam $OUT_BAM \
    --cores $SLURM_CPUS_PER_TASK \
    --log-level info

