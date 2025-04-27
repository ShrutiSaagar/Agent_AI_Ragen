#!/bin/bash

#SBATCH --account=e32706
#SBATCH --job-name=shruti_ragen_training
#SBATCH --partition=gengpu
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --gres=gpu:a100:2 
#SBATCH --time=02:00:00  
#SBATCH --mem=16G
#SBATCH --ntasks-per-node=1
#SBATCH --error=shruti_ragen_error.%j.log   # Standard error log file (%j inserts job ID)
#SBATCH --output=shruti_ragen_output.%j.log  # Standard output log file (%j inserts job ID)

# --- Load Modules ---
module purge                          # Clear existing modules
module load anaconda3
module load cuda/11.7                 # Load CUDA for PyTorch 

# --- Activate Conda Environment ---
source activate ragen_env             # Activate the RAGEN environment

# --- Navigate to Code Directory ---
cd $SLURM_SUBMIT_DIR                  # Navigate to the submission directory

# --- Set Wandb API Key (if using) ---
export WANDB_API_KEY=f9994e1f415efed5fbc4440e5d025c1788ada2ca

# --- Run the Training Script ---
echo "Starting RAGEN training with quest_hw_config..."
python train.py --config-name quest_hw_config

echo "Job finished."
