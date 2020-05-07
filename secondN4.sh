#!/bin/bash

#kilimanjaro2
#7 May 2019

bidsdir="/home/kilimanjaro2/Research/monkeyStuff/bidsData"

for inp in ./sub-*; do
  tmp=`basename ${inp}`
  echo ${tmp}
  cd "${tmp}/"
  N4BiasFieldCorrection -d 3 -b [100] -i ${bidsdir}/${tmp}/anat/${tmp}_T1w.nii.gz  -o [bias_corrected.nii.gz,bias_image.nii.gz]
  fslmaths out_mask.nii.gz  -thr 0.0001 out_tmp_mask.nii.gz
  rm out_mask.nii.gz
  mv out_tmp_mask.nii.gz out_mask.nii.gz
  fslmaths bias_corrected.nii.gz -mul out_mask.nii.gz out_file.nii.gz
cd -
done;
