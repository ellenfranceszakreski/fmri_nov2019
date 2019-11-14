#!/bin/sh
# ./make_ce_.sh
# do before coregistration
AnalysisDir=/data/scratch/zakell/fmri_nov2019 #<-- make sure this is correct!

for subx in `cat $AnalysisDir/Scripts/subjects.txt`
do
  subxDir=$AnalysisDir/Input/$subx
  if [ ! -f $subxDir/slicetime_done.mat ]; then
    continue
  elif [ -f $subxDir/coreg_done.mat ]; then
    continue
  fi
  
  thisfile="meanu"$subx"_run1.nii"
  if [ ! -f $subx/"ce_"$thisfile ]; then
    cp -v $subx/$thisfile $subx/"ce_"$thisfile
  fi
  unset thisfile
  for r in {1..3}
  do
    thisfile="au"$subx"_run"$r".nii"
    if [ ! -f $subx/"ce_"$thisfile ]; then
      cp -v $subx/$thisfile $subx/"ce_"$thisfile
    fi
  done
  unset thisfile r
done

exit 0
