#!/bin/sh
# has_step.sh <step_name>

AnalysisDir=/data/scratch/zakell/fmri_nov2019 # <--make sure this is correct!

if [ $# -ne 1 ]; then
	printf "ERROR: Incorrect number of inputs\nUsage: has_step.sh <step_name>\n" >&2
	exit 1
fi
StepName="$1"

MissingFile=$AnalysisDir/$StepName"_missing.txt"
test -f $MissingFile && rm $MissingFile

touch $MissingFile

for subx in `cat $AnalysisDir/Scripts/subjects.txt`; do
	ThisFile=$AnalysisDir/Input/$subx/$StepName"_done.mat"
	test ! -f $ThisFile && echo $subx >> $MissingFile
done

echo "-------------------------"
printf "Missing %s:\n\n" $StepName
cat $MissingFile
echo "-------------------------"

### DONE
exit 0
