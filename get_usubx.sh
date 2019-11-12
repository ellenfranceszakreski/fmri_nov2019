#!/bin/sh
#
SourceDir=/data/scratch/zakell/fmri_oct2019
AnalysisDir=/data/scratch/zakell/fmri_nov2019 #<-make sure this is correct

#
for subx in `cat $AnalysisDir/Scripts/subjects.txt`
do
  cp $SourceDir/Input/$subx/usub*.nii $AnalysisDir/Input/$subx/usub*.nii
done
### DONE
