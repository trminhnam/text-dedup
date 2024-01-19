#!/bin/bash
#SBATCH --nodes=1
#SBATCH --time=24:00:00
#SBATCH --ntasks=1
#SBATCH --job-name=noGPU
#SBATCH --output=logs/news.out
#SBATCH --error=logs/news.out
#SBATCH --nodelist=gpu01
#SBATCH --gres=gpu:0
#SBATCH --cpus-per-task=8
#SBATCH --mem=32G

export PYTHONWARNINGS="ignore"

cd ../..
python load_and_push_to_hub.py \
    --dataset_path /media/ddien/minhnam/text-dedup/output/news \
    --dataset_name tmnam20/Vietnamese-News-dedup \

