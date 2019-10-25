#!/bin/sh
# normalise_to_mni.sh <x.mnc> 
# e.g. ./normalise_to_mni.sh n3_nlm_sub10_t1.mnc
# normalise image x to MNI space (mni_icbm152_nlin_sym_09c_minc2)
# outputs e.g n3_nlm_sub10_t1.mnc
# no spaces should be in input
# requires minc toolkit and minc-toolkit-extras to run

## check input
# check input number
if [ "$#" -ne 1 ]; then
	echo "error: incorrect number of inputs"
	echo "normalise_x_to_mni.sh <x.mnc>"
	exit 1
fi
Input="$1"
# check for illegal characters
if [ `echo "$Input" | grep -o '[^a-zA-Z0-9_/.]' | wc -c` -gt 0 ]; then
	echo "error: Path and file name should contain only letters, numbers, underscores, periods and /"
	exit 1
fi
# check input extension
if [ `echo $Input | grep -oe '\.mnc$' | wc -c` -eq 0 ]; then
	echo "error: input must be .mnc file"
	exit 1
fi
# ensure file exists
if [ ! -f "$Input" ]; then
	printf "error: Could not find file at %s\n"
	exit 1
fi
### input ok
printf "Input = \"%s\"/n" $Input

# files
RegDir=/opt/quarantine/resources/mni_icbm152_t1_tal_nlin_sym_09c
RegModel=$RegDir/mni_icbm152_t1_tal_nlin_sym_09c.mnc #REGISTRATIONMODEL
RegMask=$RegDir/mni_icbm152_t1_tal_nlin_sym_09c_mask.mnc #REGISTRATIONBRAINMASK

# make output prefix name
OutputPrefix="mni_"`echo $(basename $Input) | sed -e 's/\.mnc$//g'`
# add directory to prefix if file is in different directory
if [ "$Input" != "$(basename $Input)" ]; then
	OutputPrefix=`echo $Input | sed 's:'$(basename $Input)'::g'`$OutputPrefix
fi

## 2 step registation (bestlinreg_g in minc-toolkit-extras)
bestlinreg_g -clobber -nmi -lsq12 -target_mask $RegMask $RegModel $Input $OutputPrefix"_inverse.xfm"
# get inverse to register input to standard
xfminvert $OutputPrefix"_inverse.xfm" $OutputPrefix".xfm"

# apply inverse transform (how it is SUPPOSED to work)
#itk_resample --clobber --order 3 --like $RegModel --transform $OutputPrefix"_inverse.xfm" $Input $OutputPrefix"_mni.mnc"

# this actually works
itk_resample --clobber --order 3 --like $RegModel --transform $OutputPrefix".xfm" $Input $OutputPrefix"_mni.mnc"

mincmath -clobber -clamp -const2 0 $(mincstats -quiet -max $OutputPrefix".mnc") $OutputPrefix".mnc" $OutputPrefix"_clamp.mnc"
if [ $? -eq 0 ]; then
	printf "Successfully transformed %s to %s_clamp.mnc\n" $Input $OutputPrefix
else
	printf "Failed to transform %s\n" $Input
	exit $?
fi
## check registration with
# Register $OutputPrefix"_mni_clamp.mnc" $RegModel
