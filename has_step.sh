#!/bin/sh
# has_step.sh <step name> <optional subject list>
# make list of subjects missing a step
# step completion is indicated by existance of <step name>_done.mat file in subject's input folder.

AnalysisDir=/data/scratch/zakell/fmri_nov2019 # <--make sure this is correct!
# check inputs
if [ $# -eq 1 ]
	SubjectList=$AnalysisDir/Scripts/subjects.txt
elif [ $# -eq 2 ]
	SubjectList="$2"
else
	printf "ERROR: Incorrect number of inputs\nUsage: has_step.sh <step_name> <optional subject list file>\n" >&2
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
	printf "ERROR: Invalid step name \"%s\".\nValid step names are:\n\t%s\n" "$1" "$ValidStepNames" >&2
	exit 1
fi
unset InvalidStepName ValidStepNames
## validate subject list
if [ ${#SubjectList} -eq 0 ]; then
	echo "ERROR: Subject list cannot be empty." >&2
	exit 1
elif [ -f "$SubjectList" ]; then
	echo "Subject list = "$SubjectList
else
	echo "ERROR: Cannot find subject list at: "$SubjectList >&2
	exit 1
fi
## list subjects missing this step

MissingFile=$AnalysisDir/$StepName"_missing.txt"
test -f $MissingFile && rm $MissingFile

touch $MissingFile
printf "looking for %s_done.mat in each subject's input directory\n" $StepName 

for subx in `cat "$SubjectList"`; do
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
