#!/bin/bash
#SBATCH --nodes=1
#SBATCH --time=24:00:00
#SBATCH --ntasks=1
#SBATCH --job-name=run
#SBATCH --output=logs/binhnq-news.out
#SBATCH --error=logs/binhnq-news.out
#SBATCH --nodelist=gpu01
#SBATCH --cpus-per-task=16
#SBATCH --mem=64G

cd ..
python -m text_dedup.minhash \
    --path "text" \
    --data_files "../unlabeled-text-raw/binhvq-news-corpus/*.txt" \
    --split train \
    --cache_dir "./cache" \
    --output "../dedup-unlabeled-text/binhnq-news" \
    --column text \
    --batch_size 100000 \
    --num_proc 16