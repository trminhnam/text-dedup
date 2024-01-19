from datasets import load_from_disk
import argparse
import re


def remove_footnotes(samples):
    texts = samples["text"]
    processed_texts = []
    for text in texts:
        text = text.strip()
        text = re.sub(r"\[\d+\]", "", text)
        text = re.sub(r"\s+", " ", text)
        processed_texts.append(text)
    return {"text": processed_texts}


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--dataset_path", type=str, required=True)
    parser.add_argument("--dataset_name", type=str, required=True)
    args = parser.parse_args()

    dataset = load_from_disk(args.dataset_path)
    print(dataset)
    dataset = dataset.map(
        remove_footnotes,
        num_proc=4,
        batched=True,
    )
    dataset.push_to_hub(
        args.dataset_name, token="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"
    )
