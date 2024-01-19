#!/bin/bash
#SBATCH --nodes=1
#SBATCH --time=72:00:00
#SBATCH --ntasks=1
#SBATCH --job-name=noGPU
#SBATCH --output=logs/binhvq.out
#SBATCH --error=logs/binhvq.out
#SBATCH --nodelist=gpu01
#SBATCH --gres=gpu:0
#SBATCH --cpus-per-task=96
#SBATCH --mem=900G

export PYTHONWARNINGS="ignore"
cd ../..
python -m text_dedup.minhash \
    --path "text" \
    --split train \
    --data_files "/media/ddien/minhnam/convert_to_parquet_datasets/txts/binhvq.txt" \
    --cache_dir "./cache" \
    --output "output/binhvq" \
    --column text \
    --batch_size 10000 \
    --num_proc 96 \