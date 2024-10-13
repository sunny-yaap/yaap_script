#!/bin/bash

# Remove local manifests if they exist
rm -rf .repo/local_manifests
echo "======= remove local manifest success====="
# remove tree
# rm -rf device/xiaomi/sunny
# rm -rf device/qcom/common
# rm -rf device/qcom/qssi
# rm -rf device/xiaomi/sunny-kernel
# rm -rf vendor/xiaomi/sunny
# rm -rf vendor/qcom/common
# rm -rf vendor/qcom/opensource/core-utils
# rm -rf hardware/xiaomi
# rm -rf prebuilts/gcc/linux-x86/aarch64/aarch64-elf
# rm -rf prebuilts/gcc/linux-x86/arm/arm-eabi
# rm -rf packages/apps/DisplayFeatures
# rm -rf packages/apps/KProfiles
# echo "==============removing previous tree done=========="
# To initialize your local repository using the AOSP/CAF based DerpFest source
repo init -u https://github.com/yaap/manifest.git -b fifteen --git-lfs
echo "================repo Initialize success========="
# Sync up:
/opt/crave/resync.sh
echo "==========repo sync success====="
# remove source
# echo "============remove frameworks/base success============"
# device tree
git clone https://github.com/sunny-yaap/device_xiaomi_sunny.git --depth 1 -b fifteen device/xiaomi/sunny
git clone https://github.com/yaap/device_qcom_common.git --depth 1 -b fifteen device/qcom/common
git clone https://github.com/AOSPA/android_device_qcom_qssi.git --depth 1 -b uvite device/qcom/qssi
# kernel tree
git clone https://github.com/yaap/device_xiaomi_sunny-kernel.git --depth 1 -b fifteen device/xiaomi/sunny-kernel
# vendor tree
git clone https://github.com/yaap/vendor_xiaomi_sunny.git --depth 1 -b fifteen vendor/xiaomi/sunny
git clone https://gitlab.com/yaosp/vendor_qcom_common.git --depth 1 -b fifteen vendor/qcom/common
git clone https://github.com/yaap/vendor_qcom_opensource_core-utils.git --depth 1 -b fifteen vendor/qcom/opensource/core-utils
# hardware tree
git clone https://github.com/yaap/hardware_xiaomi.git --depth 1 -b fifteen hardware/xiaomi
# prebuilts
git clone https://github.com/StatiXOS/android_prebuilts_gcc_linux-x86_aarch64_aarch64-elf.git --depth 1 -b 14.0.0 prebuilts/gcc/linux-x86/aarch64/aarch64-elf
git clone https://github.com/StatiXOS/android_prebuilts_gcc_linux-x86_arm_arm-eabi.git --depth 1 -b 12.0.0 prebuilts/gcc/linux-x86/arm/arm-eabi
# packages
git clone https://github.com/cyberknight777/android_packages_apps_DisplayFeatures.git --depth 1 -b master packages/apps/DisplayFeatures
git clone https://github.com/KProfiles/android_packages_apps_Kprofiles.git --depth 1 -b main packages/apps/KProfiles
# source modification
# Initiate the build:
source build/envsetup.sh
# Prepare device
lunch yaap_device-user
# clean install
# make installclean
# Compile yaap
m yaap





