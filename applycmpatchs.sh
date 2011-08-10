#!/bin/bash
CMParts=/home/x13thangelx/android/cm4d2g/packages/apps/CMParts
FRAMEWORKS=/home/x13thangelx/android/cm4d2g/frameworks/base
THEME=/home/x13thangelx/android/cm4d2g/vendor/tmobile/themes

# overscroll color (1/3) http://review.cyanogenmod.com/7148
cd $CMParts
git fetch http://review.cyanogenmod.com/p/CyanogenMod/android_packages_apps_CMParts refs/changes/48/7148/6 && git cherry-pick FETCH_HEAD

# Led settings rewrite http://review.cyanogenmod.com/#change,7099
cd $CMParts
git fetch http://review.cyanogenmod.com/p/CyanogenMod/android_packages_apps_CMParts refs/changes/00/7100/8 && git cherry-pick FETCH_HEAD

# overscroll color (2/3) http://review.cyanogenmod.com/7149
cd $FRAMEWORKS
git fetch http://review.cyanogenmod.com/p/CyanogenMod/android_frameworks_base refs/changes/49/7149/7 && git cherry-pick FETCH_HEAD

# Clean up RGB code http://review.cyanogenmod.com/7099
cd $FRAMEWORKS
git fetch http://review.cyanogenmod.com/p/CyanogenMod/android_frameworks_base refs/changes/99/7099/3 && git cherry-pick FETCH_HEAD

# overscroll color (3/3) http://review.cyanogenmod.com/7166
cd $THEME
git fetch http://review.cyanogenmod.com/p/CyanogenMod/themes-platform-vendor-tmobile-apps-ThemeChooser refs/changes/66/7166/3 && git cherry-pick FETCH_HEAD
