#!/bin/bash

make
cd conf
../util/make_ann_input_expressions.sh
cd ..
#./util/train_bayes.sh
make anntrainandtrial
