#!/bin/bash

set -euo pipefail

# Project configuration
PROJECT_DIR="${PROJECT_DIR:-/project/$USER/bear-microsatellite}"
SCRATCH_DIR="${SCRATCH_DIR:-${TMPDIR:-/scratch/$USER}/bear-microsatellite}"

REFERENCE="${PROJECT_DIR}/data/reference/bear_genome.fa"
QUERIES="${PROJECT_DIR}/data/raw/primers_combined.fasta"

DB_DIR="${SCRATCH_DIR}/blast_db"
RESULTS_DIR="${PROJECT_DIR}/results/blast"

mkdir -p "$DB_DIR" "$RESULTS_DIR"

# Create local nucleotide BLAST database
makeblastdb \
    -in "$REFERENCE" \
    -dbtype nucl \
    -out "${DB_DIR}/bear_genome"

# Run BLAST
blastn \
    -query "$QUERIES" \
    -db "${DB_DIR}/bear_genome" \
    -out "${RESULTS_DIR}/blast_hits.tsv" \
    -outfmt 6 \
    -word_size 7 \
    -evalue 100 \
    -dust no \
    -soft_masking false \
    -max_target_seqs 5 \
    -num_threads "${SLURM_CPUS_PER_TASK:-1}"

echo "BLAST completed successfully."
echo "Results: ${RESULTS_DIR}/blast_hits.tsv"