#!/bin/bash

make
cd conf
../util/make_ann_input_expressions.sh
cd ..
#./util/train_bayes.sh
cd trialreport
git checkout thresholdtable.txt
mv thresholdtable.txt thresholdtable-prev.txt
cd ..
make anntrainandtrial
cd trialreport
git checkout falsepositives.png
git checkout thresholds.png
mv falsepositives.png falsepositives-prev.png
mv thresholds.png thresholds-prev.png
./makegraphs.sh
cd ..