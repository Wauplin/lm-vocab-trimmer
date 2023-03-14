# Fine-tuning trimmed multilingual LM (mt5 small/base) on QG
LA='de'
SIZE="small"
MODEL="mt5-${SIZE}-trimmed-${LA}-${LA}quad-qg"
lmqg-train-search -c "lmqg_output/trimmed_qg/${MODEL}" -d "lmqg/qg_${LA}quad" -m "vocabtrimmer/mt5-${SIZE}-trimmed-${LA}" -b 32 -g 2 --lr 1e-04 5e-04 1e-03 --epoch-partial 5 -e 15 --label-smoothing 0 0.15 --language "${LA}" --n-max-config 1
lmqg-eval -m "lmqg_output/trimmed_qg/${MODEL}/best_model" -e "lmqg_output/trimmed_qg/${MODEL}/best_model/eval" --language "${LA}" -d "lmqg/qg_${LA}quad" -i "paragraph_answer" --prediction-aggregation "first" --prediction-level "sentence"
lmqg-push-to-hf -m "lmqg_output/trimmed_qg/${MODEL}/best_model" -a "${MODEL}" -o "vocabtrimmer"


for LA in 'ja' 'ko' 'ru' 'fr' 'de' 'es' 'it'
do
  for SIZE in "small" "base"
  do
    MODEL="mt5-small-trimmed-${LA}-${LA}quad-qg"
    lmqg-train-search -c "lmqg_output/trimmed_qg/${MODEL}" -d "lmqg/qg_${LA}quad" -m "vocabtrimmer/mt5-small-trimmed-${LA}" -b 16 -g 4 --lr 1e-04 5e-04 1e-03 --epoch-partial 5 -e 15 --label-smoothing 0 0.15 --language "${LA}" --n-max-config 1
    lmqg-eval -m "lmqg_output/trimmed_qg/${MODEL}/best_model" -e "lmqg_output/trimmed_qg/${MODEL}/best_model/eval" --language "${LA}" -d "lmqg/qg_${LA}quad" -i "paragraph_answer" --prediction-aggregation "first" --prediction-level "sentence"
    lmqg-push-to-hf -m "lmqg_output/trimmed_qg/${MODEL}/best_model" -a "${MODEL}" -o "vocabtrimmer"
  done
done

for LA in 'ja' 'ko' 'ru' 'fr' 'de' 'es' 'it'
do
  for SIZE in "small" "base"
  do
    for TARGET in 15000 30000 45000 60000
    do
      MODEL="mt5-small-trimmed-${LA}-${TARGET}-${LA}quad-qg"
      lmqg-train-search -c "lmqg_output/trimmed_qg/${MODEL}" -d "lmqg/qg_${LA}quad" -m "vocabtrimmer/mt5-small-trimmed-${LA}-${TARGET}" -b 16 -g 4 --lr 1e-04 5e-04 1e-03 --epoch-partial 5 -e 15 --label-smoothing 0 0.15 --language "${LA}" --n-max-config 1
      lmqg-eval -m "lmqg_output/trimmed_qg/${MODEL}/best_model" -e "lmqg_output/trimmed_qg/${MODEL}/best_model/eval" --language "${LA}" -d "lmqg/qg_${LA}quad" -i "paragraph_answer" --prediction-aggregation "first" --prediction-level "sentence"
      lmqg-push-to-hf -m "lmqg_output/trimmed_qg/${MODEL}/best_model" -a "${MODEL}" -o "vocabtrimmer"
    done
  done
done

for LA in 'ja' 'ru' 'fr' 'de' 'es' 'it'
do
  for SIZE in "small" "base"
  do
    for TARGET in 75000 90000 105000
    do
      MODEL="mt5-small-trimmed-${LA}-${TARGET}-${LA}quad-qg"
      lmqg-train-search -c "lmqg_output/trimmed_qg/${MODEL}" -d "lmqg/qg_${LA}quad" -m "vocabtrimmer/mt5-small-trimmed-${LA}-${TARGET}" -b 16 -g 4 --lr 1e-04 5e-04 1e-03 --epoch-partial 5 -e 15 --label-smoothing 0 0.15 --language "${LA}" --n-max-config 1
      lmqg-eval -m "lmqg_output/trimmed_qg/${MODEL}/best_model" -e "lmqg_output/trimmed_qg/${MODEL}/best_model/eval" --language "${LA}" -d "lmqg/qg_${LA}quad" -i "paragraph_answer" --prediction-aggregation "first" --prediction-level "sentence"
      lmqg-push-to-hf -m "lmqg_output/trimmed_qg/${MODEL}/best_model" -a "${MODEL}" -o "vocabtrimmer"
    done
  done
done

for LA in 'ja' 'ru' 'fr' 'de' 'es'
do
  for SIZE in "small" "base"
  do
    MODEL="mt5-small-trimmed-${LA}-120000-${LA}quad-qg"
    lmqg-train-search -c "lmqg_output/trimmed_qg/${MODEL}" -d "lmqg/qg_${LA}quad" -m "vocabtrimmer/mt5-small-trimmed-${LA}-120000" -b 16 -g 4 --lr 1e-04 5e-04 1e-03 --epoch-partial 5 -e 15 --label-smoothing 0 0.15 --language "${LA}" --n-max-config 1
    lmqg-eval -m "lmqg_output/trimmed_qg/${MODEL}/best_model" -e "lmqg_output/trimmed_qg/${MODEL}/best_model/eval" --language "${LA}" -d "lmqg/qg_${LA}quad" -i "paragraph_answer" --prediction-aggregation "first" --prediction-level "sentence"
    lmqg-push-to-hf -m "lmqg_output/trimmed_qg/${MODEL}/best_model" -a "${MODEL}" -o "vocabtrimmer"
  done
done