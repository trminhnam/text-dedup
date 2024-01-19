#!/bin/bash
#SBATCH --nodes=1
#SBATCH --time=24:00:00
#SBATCH --ntasks=1
#SBATCH --job-name=noGPU
#SBATCH --output=logs/books-txt.out
#SBATCH --error=logs/books-txt.out
#SBATCH --nodelist=gpu02
#SBATCH --gres=gpu:0
#SBATCH --cpus-per-task=8
#SBATCH --mem=64G

export PYTHONWARNINGS="ignore"

cd ../..
python load_and_push_to_hub.py \
    --dataset_path /media/ddien/minhnam/text-dedup/output/books-txt \
    --dataset_name tmnam20/Vietnamese-Books-dedup \
