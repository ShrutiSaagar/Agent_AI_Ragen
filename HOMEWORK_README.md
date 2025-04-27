# RAGEN Homework Assignment

## Overview

This homework assignment involves running the [RAGEN (Reasoning AGENT)](https://github.com/RAGEN-AI/RAGEN) framework on Northwestern Quest servers. RAGEN trains Large Language Model (LLM) agents using reinforcement learning to develop reasoning capabilities in interactive environments.

## Requirements

### Requirement 1: Setup and Running
- Set up the RAGEN training framework on Quest
- Successfully run training with the provided configuration
- Document any issues encountered and their solutions

### Requirement 2: Training Analysis
- Monitor and visualize training curves for:
  - Loss (actor and critic losses)
  - Rewards (mean and maximum rewards)
  - Track convergence patterns

### Requirement 3: Case Study Analysis
- Analyze the agent's thinking process
- Find and document interesting reasoning patterns
- Focus on how the agent develops strategies over time


## Setup Instructions

1. **Environment Setup**
   ```bash
   module purge
   module load anaconda3
   conda create -n ragen_env python=3.10
   source activate ragen_env
   git clone https://github.com/RAGEN-AI/RAGEN.git
   cd RAGEN
   bash scripts/setup_ragen.sh
   ```

2. **Configuration Files**
   - We've created a custom configuration file `config/quest_hw_config.yaml`
   - We've updated the SLURM batch script `run_ragen.sbatch`

3. **Running the Training**
   ```bash
   # Make sure to replace your_wandb_api_key_here in run_ragen.sbatch
   sbatch run_ragen.sbatch
   ```

## Configuration Explained

Our configuration (`quest_hw_config.yaml`) includes:

- **Selected environments**: FrozenLake and Bandit
  - FrozenLake tests planning in stochastic environments
  - Bandit tests exploration vs. exploitation

- **Model**: Qwen2.5-0.5B-Instruct
  - Smaller model for faster training on limited resources

- **Advantage estimation**: GAE (Generalized Advantage Estimation)
  - More stable training than vanilla RL

- **Hardware utilization**: 2 A100 GPUs
  - Optimized batch sizes for Quest's GPU memory

## Analyzing Results

### Training Curves
- Use Weights & Biases dashboard to monitor:
  - Actor and critic losses
  - Mean and maximum rewards
  - Policy entropy (exploration vs. exploitation)

### Case Studies
For analyzing agent reasoning:

1. Look for examples with `<think>...</think>` tags in the wandb Media tab
2. Document interesting patterns in the agent's thinking
3. Analyze how reasoning evolves across training steps
4. Compare performance between FrozenLake and Bandit environments


## Resources

- [RAGEN GitHub Repository](https://github.com/RAGEN-AI/RAGEN)
- [RAGEN Documentation](https://ragen-tutorial.readthedocs.io/)
- [Detailed Quest Setup Guide](RAGEN_QUEST_GUIDE.md)
- [Quest HPC Documentation](https://services.northwestern.edu/TDClient/30/Portal/KB/ArticleDet?ID=1964)
- [Weights & Biases Documentation](https://docs.wandb.ai/) 

