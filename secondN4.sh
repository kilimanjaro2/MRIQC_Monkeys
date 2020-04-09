N4BiasFieldCorrection -d 3 -b [100] -i site-mcgill_sub-032208_ses-001.nii.gz  -o [output_image.nii.gz,bias_image.nii.gz]
#3dSkullStrip -input output_image.nii.gz -surface_coil -prefix in_file_b.nii.gz -monkey
#3dcalc -a output_image.nii.gz -b in_file_b.nii.gz -expr 'a*step(b)' -prefix out_file.nii.gz
#fslmaths out_file.nii.gz -thr 0.001 out_mask.nii.gz
mv output_image.nii.gz bias_corrected.nii.gz
fslmaths bias_corrected.nii.gz -mul out_mask.nii.gz out_file.nii.gz
