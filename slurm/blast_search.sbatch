#!/bin/bash

#SBATCH --job-name=bear-blast
#SBATCH --output=logs/%x-%j.out
#SBATCH --error=logs/%x-%j.err
#SBATCH --time=02:00:00
#SBATCH --cpus-per-task=4
#SBATCH --mem=16G

set -euo pipefail

# Load software
module load ncbi-blast/2.16.0

# Project location
export PROJECT_DIR="/project/$USER/bear-microsatellite"

# Execute workflow
bash "${PROJECT_DIR}/scripts/02_run_blast.sh"