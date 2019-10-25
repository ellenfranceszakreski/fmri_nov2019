#!/bin/sh
# make_prepro_joblist.sh

AnalysisDir=/data/scratch/fmri_nov2019 #make sure this is correct
test -d ! $AnalysisDir/cicjobs/t1_prepro && rm -r $AnalysisDir/cicjobs/t1_prepro

JobListFile=$AnalysisDir/cicjobs/t1_prepro/joblist

touch $JobListFile
for subx in `cat $AnalysisDir/Scripts/subjects.txt`
do
  echo "./$AnalysisDir/Scripts/t1_prepro.sh "$subx >> JobListFile
done

printf "Done making jobs.\nSee jobs at %s\n" $JobListFile

printf "when ready call:\n\n"
echo "module load qbatch"
printf "qbatch -N \"efz_t1_prepro\" $AnalysisDir/cicjobs/t1_prepro/joblist\n\n"
exit 0
