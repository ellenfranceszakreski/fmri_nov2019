#!/bin/sh
# backup_step.sh <step name>
# make copies of files from particular step

AnalysisDir=/data/scratch/zakell/fmri_nov2019 # <--make sure this is correct!
## check inputs
if [ $# -eq 1 ]
	SubjectList=$AnalysisDir/Scripts/subjects.txt
elif [ $# -eq 2 ]
	SubjectList="$2"
else
	printf "ERROR: Incorrect number of inputs\nUsage: has_step.sh <step_name> <optional subject list file>\n" >&2
	exit 1
fi
## validate step name
StepName="$1"
case in "$StepName"
  "realign")
    FilePatterns=("usub*_run*.nii" "mean*run*.nii")
    ;;
  "slicetime")
    FilePatterns=("ausub*.nii")
    ;;
  "coreg_est")
    FilePatterns=("ceausub*.nii")
    ;;
  "coreg_write")
    FilePatterns=("cwusub*.nii")
  "")
    echo "ERROR: Empty step name." >&2
    exit 1
    ;;
  *)
    printf "ERROR: Invalid step name %s\n" "$StepName" >&2
    exit 1
    ;;
esac
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
######### inputs ok

## make copies
for subx in `cat "$SubjectList"`; do
  subxDir=$AnalysisDir/Input/$subx
  test ! -d $subxDir/backup && mkdir $subxDir/backup
  if [ ! -f $subxDir/$StepName"_done.mat" ]; then
    printf "%s not done for %s\n" $StepName $subx
    continue
  fi
  for ThisFile in ${FilePatterns[*]}; do
    cp -v $subxDir/$ThisFile $subxDir/backup
  done
  unset ThisFile
done
## DONE
exit 0
