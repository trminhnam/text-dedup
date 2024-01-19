#!/bin/bash
#SBATCH --nodes=1
#SBATCH --time=24:00:00
#SBATCH --ntasks=1
#SBATCH --job-name=noGPU
#SBATCH --output=logs/books-corpus.out
#SBATCH --error=logs/books-corpus.out
#SBATCH --nodelist=gpu01
#SBATCH --gres=gpu:0
#SBATCH --cpus-per-task=16
#SBATCH --mem=64G

export PYTHONWARNINGS="ignore"

cd ../..
python load_and_push_to_hub.py \
    --dataset_path /media/ddien/minhnam/text-dedup/output/books-corpus \
    --dataset_name tmnam20/Vietnamese-Book-Corpus \


    # --output "../dedup-unlabeled-text/binhnq-news" \
    # --data_files "../unlabeled-text-raw/binhvq-news-corpus/*.txt" \