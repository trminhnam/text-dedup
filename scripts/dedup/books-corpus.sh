#!/bin/bash
#SBATCH --nodes=1
#SBATCH --time=24:00:00
#SBATCH --ntasks=1
#SBATCH --job-name=noGPU
#SBATCH --output=logs/books-corpus.out
#SBATCH --error=logs/books-corpus.out
#SBATCH --nodelist=gpu01
#SBATCH --gres=gpu:0
#SBATCH --cpus-per-task=32
#SBATCH --mem=400G

export PYTHONWARNINGS="ignore"

cd ../..
python -m text_dedup.minhash \
    --path "tmnam20/VietnameseBookCorpus-raw" \
    --split train \
    --cache_dir "./cache" \
    --output "output/books-corpus" \
    --column text \
    --batch_size 100 \
    --num_proc 32 \


    # --output "../dedup-unlabeled-text/binhnq-news" \
    # --data_files "../unlabeled-text-raw/binhvq-news-corpus/*.txt" \