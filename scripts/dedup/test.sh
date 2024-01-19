#!/bin/bash
#SBATCH --nodes=1
#SBATCH --time=24:00:00
#SBATCH --ntasks=1
#SBATCH --job-name=noGPU
#SBATCH --output=logs/test.out
#SBATCH --error=logs/test.out
#SBATCH --nodelist=gpu01
#SBATCH --cpus-per-task=64
#SBATCH --mem=386G

cd ../..
python -m text_dedup.minhash \
    --path "text" \
    --split train \
    --data_files "test/text_dataset/*.txt" \
    --cache_dir "./cache" \
    --output "output/test" \
    --column text \
    --batch_size 10 \
    --num_proc 2 \
