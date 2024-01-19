#!/bin/bash
#SBATCH --nodes=1
#SBATCH --time=24:00:00
#SBATCH --ntasks=1
#SBATCH --job-name=noGPU
#SBATCH --output=logs/books-txt.out
#SBATCH --error=logs/books-txt.out
#SBATCH --nodelist=gpu01
#SBATCH --gres=gpu:0
#SBATCH --cpus-per-task=96
#SBATCH --mem=800G

export PYTHONWARNINGS="ignore"

cd ../..
python -m text_dedup.minhash \
    --path "text" \
    --split train \
    --data_files "/media/ddien/minhnam/convert_to_parquet_datasets/txts/books-txt.txt" \
    --cache_dir "./cache" \
    --output "output/books-txt" \
    --column text \
    --batch_size 1000 \
    --num_proc 96 \