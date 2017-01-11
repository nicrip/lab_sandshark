#!/bin/bash

## N. Rypkema rypkema@mit.edu

## specify C++ library directories from 1_drivers, 2_processing, 3_filtering, 4_autonomy to link to this project
declare -a cpp_lib_dirs=(
"../lab_4_autonomy/cpp/lib/behaviors-rypkema/"
"../lab_3_filtering/cpp/lib/kalman_filter/"
"../lab_2_processing/cpp/lib/magfield/"
"../lab_1_drivers/cpp/lib/mcc_usb_1608fs_plus/"
)

## specify C++ application directories from 1_drivers, 2_processing, 3_filtering, 4_autonomy to link to this project
declare -a cpp_app_dirs=(
)

## specify Python directories from 1_drivers, 2_processing, 3_filtering, 4_autonomy to link to this project
declare -a python_dirs=(
"../lab_3_filtering/python/beamforming/"
"../lab_1_drivers/python/razor_imu/"
)

## automated linking of desired directories
for i in "${cpp_lib_dirs[@]}"
do
   i_=$(readlink -f "$i")
   echo "adding symbolic link: $i_" 
   ln -s "$i_" "./src/cpp/lib"
done

for i in "${cpp_app_dirs[@]}"
do
   i_=$(readlink -f "$i")
   echo "adding symbolic link: $i_" 
   ln -s "$i_" "./src/cpp/app"
done

for i in "${python_dirs[@]}"
do
   i_=$(readlink -f "$i")
   echo "adding symbolic link: $i_" 
   ln -s "$i_" "./src/python"
done
