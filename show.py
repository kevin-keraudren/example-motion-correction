#!/usr/bin/python

import irtk
from glob import glob
import os

def show(all_files,prefix="",saturate=False):
    for f in all_files:
        name = os.path.basename(f)[:-len('.nii.gz')]
        img = irtk.imread(f,dtype="float32")
        if saturate:
            img = img.saturate().rescale()
        png_name = "img/"+prefix+name+".png"
        print png_name
        irtk.imshow(img,filename=png_name)
    
show(glob("data/*.nii.gz"),saturate=True)
show(glob("output_detection/*.nii.gz"),"detection_")
show(glob("output_segmentation/*.nii.gz"),saturate=True)
show(["output_reconstruction/motion_corrected_volume.nii.gz"],saturate=True)

