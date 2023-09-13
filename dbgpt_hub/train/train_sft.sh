deepspeed --num_gpus 2 --master_port=9901 src/train_bash.py \
    --deepspeed ds_config.json \
    --quantization_bit 4 \
    --model_name_or_path /home/pci/data/cpf/Baichuan2-13B-Chat \
    --do_train \
    --dataset example_text2sql \
    --max_source_length 2048 \
    --max_target_length 512 \
    --template baichuan2 \
    --finetuning_type lora \
    --lora_rank 32 \
    --lora_alpha 64 \
    --lora_target W_pack \
    --output_dir path_to_sft_checkpoint \
    --overwrite_cache \
    --overwrite_output_dir \
    --per_device_train_batch_size 1 \
    --gradient_accumulation_steps 4 \
    --lr_scheduler_type cosine_with_restarts \
    --logging_steps 10 \
    --save_steps 1000 \
    --learning_rate 5e-5 \
    --num_train_epochs 6.0 \
    --plot_loss \
    --bf16