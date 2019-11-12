#!/bin/sh
# import_raw_data.sh
# import raw EPI files and anatomical scans to scratch

## directories
AnalysisDir=/data/scratch/zakell/fmri_nov2019 #<-- make sure this is correct!
InputDir=$AnalysisDir/Input
niiSrcDir=/data/chamal/projects/zakell/subx_nii #where nifti files are


# remove input dir if it is there
test -d $InputDir && rm -r $InputDir
mkdir $InputDir
# typical subjects
# for each subject
for subx in `cat $AnalysisDir/Scripts/subjects.txt`
do
	# delete old subject's directory and make directory again
	test -d $InputDir/$subx && rm -r $InputDir/$subx
	mkdir $InputDir/$subx
	# copy epis (special subject's fixed later)
	cp -v $niiSrcDir/$subx"_3.nii" $InputDir/$subx/$subx"_run1.nii"
	cp -v $niiSrcDir/$subx"_4.nii" $InputDir/$subx/$subx"_run2.nii"
	cp -v $niiSrcDir/$subx"_5.nii" $InputDir/$subx/$subx"_run3.nii"
	cp -v $niiSrcDir/$subx"_6.nii" $InputDir/$subx/$subx"_anat.nii"
done
unset subx
### special subjects
# sub1 (sub5) sub6 sub10 sub21 sub22 sub28 sub68
subx="sub1"
rm $InputDir/$subx/*_run*.nii $InputDir/$subx/$subx"_anat.nii"
# no valid run 1
cp -v $niiSrcDir/$subx"_5.nii" $InputDir/$subx/$subx"_run2.nii"
cp -v $niiSrcDir/$subx"_6.nii" $InputDir/$subx/$subx"_run3.nii"
cp -v $niiSrcDir/$subx"_7.nii" $InputDir/$subx/$subx"_anat.nii"
unset subx

subx="sub5"
rm $InputDir/$subx/*_run*.nii $InputDir/$subx/$subx"_anat.nii"
cp -v $niiSrcDir/$subx"_3.nii" $InputDir/$subx/$subx"_run1.nii"
cp -v $niiSrcDir/$subx"_6.nii" $InputDir/$subx/$subx"_run2.nii" # 4 and 5 were bad
cp -v $niiSrcDir/$subx"_7.nii" $InputDir/$subx/$subx"_run3.nii"
cp -v $niiSrcDir/$subx"_8.nii" $InputDir/$subx/$subx"_anat.nii"
unset subx

subx="sub6"
rm $InputDir/$subx/*_run*.nii $InputDir/$subx/$subx"_anat.nii"
cp -v $niiSrcDir/$subx"_4.nii" $InputDir/$subx/$subx"_run1.nii"
cp -v $niiSrcDir/$subx"_5.nii" $InputDir/$subx/$subx"_run2.nii"
cp -v $niiSrcDir/$subx"_6.nii" $InputDir/$subx/$subx"_run3.nii"
cp -v $niiSrcDir/$subx"_7.nii" $InputDir/$subx/$subx"_anat.nii"
unset subx

subx="sub10"
rm $InputDir/$subx/*_run*.nii $InputDir/$subx/$subx"_anat.nii"
cp -v $niiSrcDir/$subx"_4.nii" $InputDir/$subx/$subx"_run1.nii"
cp -v $niiSrcDir/$subx"_5.nii" $InputDir/$subx/$subx"_run2.nii"
cp -v $niiSrcDir/$subx"_6.nii" $InputDir/$subx/$subx"_run3.nii"
cp -v $niiSrcDir/$subx"_7.nii" $InputDir/$subx/$subx"_anat.nii"
unset subx

subx="sub21"
rm $InputDir/$subx/*_run*.nii $InputDir/$subx/$subx"_anat.nii"
cp -v $niiSrcDir/$subx"_4.nii" $InputDir/$subx/$subx"_run1.nii"
cp -v $niiSrcDir/$subx"_5.nii" $InputDir/$subx/$subx"_run2.nii"
cp -v $niiSrcDir/$subx"_6.nii" $InputDir/$subx/$subx"_run3.nii"
cp -v $niiSrcDir/$subx"_7.nii" $InputDir/$subx/$subx"_anat.nii"
unset subx

subx="sub28"
rm $InputDir/$subx/*_run*.nii $InputDir/$subx/$subx"_anat.nii"
cp -v $niiSrcDir/$subx"_5.nii" $InputDir/$subx/$subx"_run1.nii" # 3 and 4 were bad
cp -v $niiSrcDir/$subx"_6.nii" $InputDir/$subx/$subx"_run2.nii"
cp -v $niiSrcDir/$subx"_7.nii" $InputDir/$subx/$subx"_run3.nii"
cp -v $niiSrcDir/$subx"_8.nii" $InputDir/$subx/$subx"_anat.nii"
unset subx

subx="sub68"
rm $InputDir/$subx/*_run*.nii $InputDir/$subx/$subx"_anat.nii"
cp -v $niiSrcDir/$subx"_4.nii" $InputDir/$subx/$subx"_run1.nii"
cp -v $niiSrcDir/$subx"_5.nii" $InputDir/$subx/$subx"_run2.nii"
cp -v $niiSrcDir/$subx"_6.nii" $InputDir/$subx/$subx"_run3.nii"
cp -v $niiSrcDir/$subx"_7.nii" $InputDir/$subx/$subx"_anat.nii"
unset subx
#### done
echo "Done copying files"
