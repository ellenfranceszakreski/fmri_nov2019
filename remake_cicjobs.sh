#!/bin/sh
# remake_cicjobs.sh <JobName> <optional subject list file>
# e.g. ./remake_cicjobs.sh prepro
# make cic job file for each subject and list of cic jobs (cicjobs/cicjoblist) and test job list
# required: Scripts/subjects.txt
# required: Scripts/<JobName>_job_template.m
# <JobName>_job_template.m must be MATLAB 2012a compatible '.m' script that depends on a variable subx (subject name).

## Analysis directory
AnalysisDir=/data/scratch/zakell/fmri_nov2019 #<-- make sure this is correct!
if [ ! -d $AnalysisDir ]; then
	printf "ERROR: Could not find analysis directory at %s\n " "$AnalysisDir" &>2
	exit 1
fi
###################################################################################################
## Validate inputs
## subject list ---------------
if [ $# -eq 1 ]; then
	SubjectList=$AnalysisDir/Scripts/subjects.txt
elif [ $# -eq 2 ]; then
	SubjectList="$2"
	if [ ${#SubjectList} -eq 0 ]; then
		echo "ERROR: Invalid SubjectList. SubjectList must have at least 1 character." &>2
		exit 1
	fi
else
	printf "ERROR: Incorrect number of inputs.\nusage:  ./remake_cicjobs.sh <JobName> <optional subject list file>\n" &>2
	exit 1
fi
# ensure subject list exists and is not empty
if [ ! -f "$SubjectList" ]; then
	echo "ERROR: Invalid subject lis. file does not exist at $SubjectList" &>2
	exit 1
elif [ `cat "$SubjectList" | wc -l` -eq 0 ]; then
	echo "error: Subject list $SubjectList is empty." &>2
	exit 1
fi
echo "Using subject list: $SubjectList"
## job name  ---------------
JobName=$1
# ensure JobName is not ""
if [ ${#JobName} -eq 0 ]; then
	echo "ERROR: Invalid JobName. JobName must have at least 1 character." &>2
	exit 1
fi
# check for bad characters (i.e. not letters, numbers or underscores)
if [ `echo "$JobName" | grep -Eo [^0-9a-zA-Z_] | wc -l` -ne 0  ]; then
	echo "ERROR: Invalid JobName. JobName must contain only letters, numbers or underscores." &>2
	exit 1
fi
## template file for this type of job ---------------
TemplateFile=$AnalysisDir/Scripts/$JobName"_job_template.m"
if [ -f $TemplateFile ]; then
	echo "Found job file template at $TemplateFile"
else
	echo "ERROR: Could not find template at $TemplateFile." &>2
	exit 1
fi
## job directory ---------------
test ! -d $AnalysisDir/cicjobs && mkdir $AnalysisDir/cicjobs
JobDir=$AnalysisDir/cicjobs/$JobName # cic job .m files kept here
if [ -d $JobDir ]; then
  rm -r $JobDir
fi
# make new job directory
mkdir $JobDir
## job list file
cicjoblistFile=$JobDir/cicjoblist
touch $cicjoblistFile
###################################################################################################
# for each subject in subject list
for subx in `cat "$SubjectList"`
do
	# make individual job file for this subject
	jobfile=$JobDir/$subx"_job.m"
	touch $jobfile
	# prepend code setting variable "subx" to this subject
	echo "subx = '"$subx"';" > $jobfile # note subject names are character vectors (e.g. 'sub2', 'sub10', etc.)
	# add code to job .m file (same for all subjects)
	cat $TemplateFile >> $jobfile
	echo "made "$jobfile
	# append command for starting job for this subject to the job list file
	echo "matlab -nodesktop -nodisplay -nosplash -r \"run('"$jobfile"')\"" >> $cicjoblistFile
done
unset subx
# use job file from last subject to make test job list
touch $JobDir/test_cicjoblist
echo "matlab -nodesktop -nodisplay -nosplash -r \"run('"$jobfile"')\"" >> $JobDir/test_cicjoblist
### display stats
echo `cat $cicjoblistFile | wc -l`" jobs were made"
## done
echo "done making cic jobs, cic job list and test cic job list. See "$JobDir
exit 0
