#!/bin/bash

set -x
set -e

SRC_DIR="/vol/biomedic/users/kpk09/gitlab/irtk/wrapping/cython/scripts/machine_learning/fetal-brain-detection"

fold=$1

mkdir -p model
    
training_patients="10_folds/training_$fold.tsv"
original_folder="/vol/biomedic/users/kpk09/DATASETS/Originals/"
clean_brainboxes="metadata/list_boxes.tsv"
NEW_SAMPLING=0.8
vocabulary="model/vocabulary_$fold.npy"
vocabulary_step=2
mser_detector="model/mser_detector_${fold}_linearSVM"
ga_file="metadata/ga.csv"
    
python $SRC_DIR/create_bow.py \
    --training_patients $training_patients \
    --new_sampling $NEW_SAMPLING \
    --original_folder $original_folder \
    --step $vocabulary_step \
    --output $vocabulary

python $SRC_DIR/learn_mser.py \
    --training_patients $training_patients \
    --new_sampling $NEW_SAMPLING \
    --original_folder $original_folder \
    --clean_brainboxes $clean_brainboxes \
    --ga_file $ga_file \
    --vocabulary $vocabulary \
    --output $mser_detector


