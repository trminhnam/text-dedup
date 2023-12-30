```bash
python -m text_dedup.minhash   --path "tmnam20/vnexpress_20231013"   --name "all"   --split train   --cache_dir "./cache"   --output "output/minhash/vnexpress"   --column content   --batch_size 10000 --num_proc -1
```

```bash
python -m text_dedup.minhash --path "text" --data_files "test/text_dataset/*.txt" --split train --cache_dir "./cache" --output "output/test/text_dataset" --column text --batch_size 100000 --num_proc -1
```
