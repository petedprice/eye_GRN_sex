#!/bin/bash
#SBATCH --job-name=souporcell
#SBATCH --output=/mnt/parscratch/users/bi1pp/work/souporcell.%j.out
#SBATCH --error=/mnt/parscratch/users/bi1pp/work/souporcell.%j.err
#SBATCH --time=24:00:00
#SBATCH --cpus-per-task=32
#SBATCH --mem=800G

# Load singularity if needed
module load singularity   # comment out if not required on your system

# Run souporcell inside the container
singularity exec /mnt/parscratch/users/bi1pp/sex_grn/souporcell_release.sif \
    souporcell_pipeline.py \
    -i /mnt/parscratch/users/bi1pp/sex_grn/files_for_peter/possorted_genome_bam.bam \
    -b /mnt/parscratch/users/bi1pp/sex_grn/files_for_peter/filtered_feature_bc_matrix/barcodes.tsv \
    -f /mnt/parscratch/users/bi1pp/sex_grn/files_for_peter/Tdal_combined_rc_mt_fasta.fa \
    -t ${SLURM_CPUS_PER_TASK} \
    -o /mnt/parscratch/users/bi1pp/sex_grn/souporcell_out \
    -k 12

