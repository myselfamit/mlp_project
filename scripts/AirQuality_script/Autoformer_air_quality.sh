export CUDA_VISIBLE_DEVICES=1

# python -u run.py --is_training 1 --root_path ./data/ --data_path air_quality1.csv --model_id air_quality_96_96_single_target --model Autoformer --data custom --features M --target "CO(GT)" --freq d --seq_len 96 --label_len 48 --pred_len 96 --e_layers 2 --d_layers 1 --factor 3 --enc_in 13 --dec_in 13 --c_out 1 --des 'AirQuality' --itr 1 --train_epochs 2


python -u run.py \
  --is_training 1 \
  --root_path ./data/ \
  --data_path air_quality1.csv \
  --model_id air_quality_96_96_single_target \
  --model Autoformer \
  --data custom \
  --features M \
  --target "CO(GT)" \
  --freq d \
  --seq_len 96 \
  --label_len 48 \
  --pred_len 96 \
  --e_layers 2 \
  --d_layers 1 \
  --factor 3 \
  --enc_in 13 \
  --dec_in 13 \
  --c_out 1 \
  --des 'AirQuality' \
  --itr 1 \
  --train_epochs 2

python -u run.py \
  --is_training 1 \
  --root_path ./data/ \
  --data_path air_quality1.csv \
  --model_id air_quality_96_96_single_target \
  --model Autoformer \
  --data custom \
  --features M \
  --target "CO(GT)" \
  --freq d \
  --seq_len 96 \
  --label_len 48 \
  --pred_len 336 \
  --e_layers 2 \
  --d_layers 1 \
  --factor 3 \
  --enc_in 13 \
  --dec_in 13 \
  --c_out 1 \
  --des 'AirQuality' \
  --itr 1 \
  --train_epochs 2


python -u run.py \
  --is_training 1 \
  --root_path ./data/ \
  --data_path air_quality1.csv \
  --model_id air_quality_96_96_single_target \
  --model Autoformer \
  --data custom \
  --features M \
  --target "CO(GT)" \
  --freq d \
  --seq_len 96 \
  --label_len 48 \
  --pred_len 720 \
  --e_layers 2 \
  --d_layers 1 \
  --factor 3 \
  --enc_in 13 \
  --dec_in 13 \
  --c_out 1 \
  --des 'AirQuality' \
  --itr 1 \
  --train_epochs 2

