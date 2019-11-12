#!/bin/sh
#
SourceDir=/data/scratch/zakell/fmri_oct2019
AnalysisDir=/data/scratch/zakell/fmri_nov2019 #<-make sure this is correct

#
for subx in `cat $AnalysisDir/Scripts/subjects.txt`
do
cp -v $SourceDir/Input/$subx/usub*.nii $AnalysisDir/Input/$subx
done
### DONE
