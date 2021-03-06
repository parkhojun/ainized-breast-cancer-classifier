#!/bin/bash

export PYTHONPATH=$(pwd):$PYTHONPATH

#echo 'Stage 1: Crop Mammograms'
python3 src/cropping/crop_mammogram.py \
    --input-data-folder 'sample_data/images' \
    --output-data-folder 'public/sample_output/cropped_images' \
    --exam-list-path 'sample_data/exam_list_before_cropping.pkl'  \
    --cropped-exam-list-path 'public/sample_output/cropped_images/cropped_exam_list.pkl'  \
    --num-processes 10

#echo 'Stage 2: Extract Centers'
#python3 src/optimal_centers/get_optimal_centers.py \
#    --cropped-exam-list-path 'public/sample_output/cropped_images/cropped_exam_list.pkl' \
#    --data-prefix 'public/sample_output/cropped_images' \
#    --output-exam-list-path 'public/sample_output/data.pkl' \
#    --num-processes 10

#echo 'Stage 3: Run Classifier (Image)'
#python3 src/modeling/run_model.py \
#    --model-path 'models/sample_image_model.p' \
#    --data-path 'public/sample_output/data.pkl' \
#    --image-path 'public/sample_output/cropped_images' \
#    --output-path 'public/sample_output/imageheatmaps_predictions.csv' \
#    --use-augmentation \
#    --num-epochs 5 \
#    --device-type 'cpu' \
#    --gpu-number 0