#!/bin/sh
# has_step.sh <step name>
# make list of subjects missing a step
# step completion is indicated by existance of <step name>_done.mat file in subject's input folder.

AnalysisDir=/data/scratch/zakell/fmri_nov2019 # <--make sure this is correct!
# check inputs
if [ $# -ne 1 ]; then
	printf "ERROR: Incorrect number of inputs\nUsage: has_step.sh <step_name>\n" >&2
	exit 1
fi
## validate step name
ValidStepNames=("realign" "slicetime" "coreg")
InvalidStepName=true
for StepName in ${ValidStepNames[*]}
do
	if [ "$1" = $StepName ]; then
		InvalidStepName=false
		break
	fi
done
if $InvalidStepName; then
	ValidStepNames=`echo ${ValidStepNames[*]}`
	printf "ERROR: Invalid step name \"%s\".\nValid step names are:\n\t%s\n" "$1" "$ValidStepNames"
	exit 1
fi
unset InvalidStepName ValidStepNames
## list subjects missing this step

MissingFile=$AnalysisDir/$StepName"_missing.txt"
test -f $MissingFile && rm $MissingFile

touch $MissingFile
printf "looking for %s_done.mat in each subject's input directory\n" $StepName 

for subx in `cat $AnalysisDir/Scripts/subjects.txt`; do
	ThisFile=$AnalysisDir/Input/$subx/$StepName"_done.mat"
	test ! -f $ThisFile && echo $subx >> $MissingFile
done

echo "-------------------------"
printf "%d subjects missing %s:\n\n" `cat $MissingFile | wc -l` $StepName
cat $MissingFile
echo "-------------------------"

printf "subjects missing %s are listed at\n\t%s\n" $StepName $MissingFile

### DONE
exit 0
