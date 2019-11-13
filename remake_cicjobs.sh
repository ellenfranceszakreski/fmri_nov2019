#!/bin/sh
# remake_cicjobs.sh <JobName> <optional subject list file>
# e.g. ./remake_cicjobs.sh prepro
# make cic job file for each subject and list of cic jobs (cicjobs/cicjoblist) and test job list
# required: Scripts/subjects.txt
# required: Scripts/<JobName>_job_template.m
# <JobName>_job_template.m must be MATLAB 2012a compatible '.m' script that depends on a variable subx (subject name).

# analysis directory
AnalysisDir=/data/scratch/zakell/fmri_oct2019
if [ ! -d $AnalysisDir ]; then
	echo "error: Could not find analysis directory at "$AnalysisDir
	unset AnalysisDir
	exit 1
fi
