#!/bin/sh
# ./prepro.sh <subx>
# e.g. ./prepro.sh sub10
# preprocess 1 subject
# requires minc-toolkit and minc-toolkit-extras

subx=$1

AnalysisDir=/data/scratch/zakell/fmri_nov2019 #make sure this is correct

subxDir=$AnalysisDir/Input/$subx

# start log
test ! -f $subxDir/prepro_log.txt && touch $subxDir/prepro_log.txt
echo "Prepro =======================================" >> $subxDir/prepro_log.txt
printf "%s\n" "$now" >> $subxDir/prepro_log.txt

# non-local means filter denoise
mincnlm -clobber $subxDir/$subx"_anat.mnc" $subxDir/"nlm_"$subx"_anat.mnc"
if [ $? -eq 0 ]; then
  printf "denoised image, %s" "nlm_"$subx"_anat.mnc" >> $subxDir/prepro_log.txt
else
  printf "error: %s denoise failed\n" $subx >> $subxDir/prepro_log.txt
  exit 1
fi

# N3 correction
nu_correct -clobber -iter 200 -shrink 2 -stop 0.000001 -fwhm 0.05 -distance 30 \
$subxDir/"nlm_"$subx"_anat.mnc" $subxDir/"n3_nlm_"$subx"_anat.mnc"
if [ $? -eq 0 ]; then
  printf "n3 bias corrected image, %s\n" "n3_nlm_"$subx"_anat.mnc" >> $subxDir/prepro_log.txt
else
  printf "error: %s n3 bias correction failed!\n" $subx >> $subxDir/prepro_log.txt
  exit 1
fi

## normalise to MNI (requires minc toolkit extras
RegDir=/opt/quarantine/resources/mni_icbm152_t1_tal_nlin_sym_09c
RegModel=$RegDir/mni_icbm152_t1_tal_nlin_sym_09c.mnc
RegMask=$RegDir/mni_icbm152_t1_tal_nlin_sym_09c_mask.mnc #REGISTRATIONBRAINMASK
if [ $? -eq 0 ]; then
  printf "n3 bias corrected image, %s\n" "n3_nlm_"$subx"_anat.mnc" >> $subxDir/prepro_log.txt
else
  printf "error: %s n3 bias correction failed!\n" $subx >> $subxDir/prepro_log.txt
  exit 1
fi

## 2 step registation (bestlinreg_g in minc-toolkit-extras)
# 1st registrion
bestlinreg_g -clobber -nmi -lsq12 -target_mask $RegMask \
$RegModel $subxDir/"n3_nlm_"$subx"_anat.mnc" $subxDir/$subx"_mni_inverse.xfm"
if [ $? -ne 0 ]; then
  printf "error: %s normalise failed!\n" $subx >> $subxDir/prepro_log.txt
  exit 1
fi
# get inverse to register input to standard
xfminvert $subxDir/$subx"_mni_inverse.xfm" $subxDir/$subx"_mni.xfm"

# resample (don't use inverse)
itk_resample --clobber --order 3 --like $RegModel --transform $subxDir/$subx"_mni.xfm" \
 $subxDir/"n3_nlm_"$subx"_anat.mnc" $subxDir/"mni_n3_nlm_"$subx"_anat.mnc"

if [ $? -ne 0 ]; then
  printf "error: %s normalise resample failed!\n" $subx >> $subxDir/prepro_log.txt
  exit 1

fi
# clamp
mincmath -clobber -clamp -const2 0 $(mincstats -quiet -max $subxDir/"mni_n3_nlm_"$subx"_anat.mnc") \
$subxDir/"mni_n3_nlm_"$subx"_anat.mnc" $subxDir/"cmni_n3_nlm_"$subx"_anat.mnc"
if [ $? -eq 0 ]; then
  printf "normalise clamp %s\n" "cmni_n3_nlm_"$subx"_anat.mnc" >> $subxDir/prepro_log.txt
else
  printf "error: %s normalise clamp failed!\n" $subx >> $subxDir/prepro_log.txt
  exit 1
fi
# Done
printf "Preprocessing completed at %s\n" "$now" >> $subxDir/prepro_log.txt
exit 0
