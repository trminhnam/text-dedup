#!/bin/bash
#SBATCH --nodes=1
#SBATCH --time=24:00:00
#SBATCH --ntasks=1
#SBATCH --job-name=noGPU
#SBATCH --output=logs/news.out
#SBATCH --error=logs/news.out
#SBATCH --nodelist=gpu01
#SBATCH --gres=gpu:0
#SBATCH --cpus-per-task=96
#SBATCH --mem=860G

export PYTHONWARNINGS="ignore"

cd ../..
python -m text_dedup.minhash \
    --path "text" \
    --split train \
    --data_files "/media/ddien/minhnam/convert_to_parquet_datasets/txts/news.txt" \
    --cache_dir "./cache" \
    --output "output/news" \
    --column text \
    --batch_size 1000 \
    --num_proc 64 \
