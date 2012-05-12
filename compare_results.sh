echo 'usage: namestring1 path1 namestring2 path2'

string1=$1
file1=$2
string2=$3
file2=$4

tail -n +2 $file1 > $file1.tmp
tail -n +2 $file2 > $file2.tmp

octave --silent compare_results.m $string1 $file1.tmp $string2 $file2.tmp