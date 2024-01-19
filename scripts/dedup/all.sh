export PYTHONWARNINGS="ignore"

cd ../..
python -m text_dedup.minhash \
    --path "text" \
    --split train \
    --data_files "txts/*.txt" \
    --cache_dir "./cache" \
    --output "output/txt" \
    --column text \
    --batch_size 10000 \
    --num_proc 96 \