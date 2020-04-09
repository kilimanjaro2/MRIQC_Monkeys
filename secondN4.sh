N4BiasFieldCorrection -d 3 -b [100] -i input.nii.gz  -o [output_image.nii.gz,bias_image.nii.gz]
#3dSkullStrip -input output_image.nii.gz -surface_coil -prefix in_file_b.nii.gz -monkey
#3dcalc -a output_image.nii.gz -b in_file_b.nii.gz -expr 'a*step(b)' -prefix out_file.nii.gz
#fslmaths out_file.nii.gz -thr 0.001 out_mask.nii.gz
#Original mask file has datatype = 512 which is leading to errors
fslmaths /misc/evarts2/MONKEY_MRIQC/NEW_EXAMPLES_RUN/mask/site-inb_sub-032401_ses-001_mask.nii.gz -thr 0.0001 out_mask.nii.gz
mv output_image.nii.gz bias_corrected.nii.gz
fslmaths bias_corrected.nii.gz -mul out_mask.nii.gz out_file.nii.gz
