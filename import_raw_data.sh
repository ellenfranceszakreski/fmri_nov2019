#!/bin/sh
# import_raw_data.sh <options>
# import_raw_data.sh -epi # epi only
# import_raw_data.sh -epi -anat # epi only
# import raw EPI files and anatomical scans to scratch

## variables
AnalysisDir=/data/scratch/zakell/fmri_nov2019 #<-- make sure this correct
## directories
InputDir=$AnalysisDir/Input
niiSrcDir=/data/chamal/projects/zakell/subx_nii #where nifti files are
n3_nlmDir=/data/scratch/zakell/fmri_nov2019/n3_nlm

DoEpi=false
DoAnat=false

if [ $# -eq 0 ]; then
	printf "ERROR: Invalid number of inputs\ne.g.\nimport_raw_data.sh -epi\nimport_raw_data.sh -epi -anat\n" &>2
	exit 1
fi
while [ $# -gt 0 ]; do
	case "$1" in
		"-epi")
			DoEpi=true
			;;
		"-anat")
			DoAnat=true
			;;
		"*")
			echo "ERROR: Invalid option." &>2
			exit 1
			;;
	esac
	shift
done
## Input ok set up directories

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
	if $DoEpi; then
		cp -v $niiSrcDir/$subx"_3.nii" $InputDir/$subx/$subx"_run1.nii"
		cp -v $niiSrcDir/$subx"_4.nii" $InputDir/$subx/$subx"_run2.nii"
		cp -v $niiSrcDir/$subx"_5.nii" $InputDir/$subx/$subx"_run3.nii"
	fi
	if $DoAnat; then
		cp -v n3_nlmDir/"n3_nlm_"$subx"_anat.mnc.gz" $InputDir/$subx/$subx"_n3_nlm.mnc.gz"
	fi
done
unset subx
if [ $DoEpi = false ]; then
	exit 0
fi
### special subjects
# sub1 (sub5) sub6 sub10 sub21 sub22 sub28 sub68
subx="sub1"
# no valid run 1
cp -v $niiSrcDir/$subx"_5.nii" $InputDir/$subx/$subx"_run2.nii"
cp -v $niiSrcDir/$subx"_6.nii" $InputDir/$subx/$subx"_run3.nii"
unset subx

subx="sub5"
cp -v $niiSrcDir/$subx"_3.nii" $InputDir/$subx/$subx"_run1.nii"
cp -v $niiSrcDir/$subx"_6.nii" $InputDir/$subx/$subx"_run2.nii" # 4 and 5 were bad
cp -v $niiSrcDir/$subx"_7.nii" $InputDir/$subx/$subx"_run3.nii"
unset subx

subx="sub6"
cp -v $niiSrcDir/$subx"_4.nii" $InputDir/$subx/$subx"_run1.nii"
cp -v $niiSrcDir/$subx"_5.nii" $InputDir/$subx/$subx"_run2.nii"
cp -v $niiSrcDir/$subx"_6.nii" $InputDir/$subx/$subx"_run3.nii"
unset subx

subx="sub10"
cp -v $niiSrcDir/$subx"_4.nii" $InputDir/$subx/$subx"_run1.nii"
cp -v $niiSrcDir/$subx"_5.nii" $InputDir/$subx/$subx"_run2.nii"
cp -v $niiSrcDir/$subx"_6.nii" $InputDir/$subx/$subx"_run3.nii"
unset subx

subx="sub21"
cp -v $niiSrcDir/$subx"_4.nii" $InputDir/$subx/$subx"_run1.nii"
cp -v $niiSrcDir/$subx"_5.nii" $InputDir/$subx/$subx"_run2.nii"
cp -v $niiSrcDir/$subx"_6.nii" $InputDir/$subx/$subx"_run3.nii"
unset subx

subx="sub28"
cp -v $niiSrcDir/$subx"_5.nii" $InputDir/$subx/$subx"_run1.nii" # 3 and 4 were bad
cp -v $niiSrcDir/$subx"_6.nii" $InputDir/$subx/$subx"_run2.nii"
cp -v $niiSrcDir/$subx"_7.nii" $InputDir/$subx/$subx"_run3.nii"
unset subx

subx="sub68"
cp -v $niiSrcDir/$subx"_4.nii" $InputDir/$subx/$subx"_run1.nii"
cp -v $niiSrcDir/$subx"_5.nii" $InputDir/$subx/$subx"_run2.nii"
cp -v $niiSrcDir/$subx"_6.nii" $InputDir/$subx/$subx"_run3.nii"
unset subx
#### done
echo "Done copying files"
