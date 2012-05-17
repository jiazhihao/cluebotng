set terminal pdfcairo
set output 'falsepositives.pdf'

set title 'Vandalism Detection Rate by False Positives'
set xlabel 'False Positive Rate'
set ylabel 'Portion of Vandalism'
set xrange [0.0:0.2]
set grid

plot 'thresholdtable.txt' using 3:2 title 'Vandalism Detection Rate' with lines

