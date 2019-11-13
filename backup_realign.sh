#!/bin/sh
# backup_realign.sh

AnalysisDir=/data/scratch/zakell/fmri_nov2019
for subx in `cat $AnalysisDir/Scripts/subjects.txt`; do
  subxDir=$AnalysisDir/Input/$subx
  if [ -f $subxDir/realign_done.mat ] && [ ! -d $subxDir/realign ]; then
    mkdir $subxDir/realign
    cp -v $subxDir/mean*.nii $subxDir/realign
    cp -v $subxDir/usub*run*.nii $subxDir/realign
  fi
done
