#!/bin/bash
clear


DEVICE_NAME=$(hostname) # Example: Get device name from the system (can be customized)

cd $HOME/Documents/WORKSPACE/kilian


# Check if an argument is provided
if [ "$1" == "pull" ]; then
  git reset --hard HEAD
  git pull
  git log --oneline -5
  flutter doctor
  flutter pub get
  flutter clean
  pod install
  flutter pub get
  rm -rf $HOME/Documents/WORKSPACE/kilian/ios/Runner/Assets.xcassets/AppIcon.appiconset
  cp -R  $HOME/Documents/WORKSPACE/kilian_deploy/AppIcon.appiconset     $HOME/Documents/WORKSPACE/kilian/ios/Runner/Assets.xcassets/
fi



# killall Simulator

if xcrun simctl list devices | grep -q "Booted"; then
    echo "iOS Simulator is running."
else
    echo "No iOS Simulator is running."
    open -a Simulator
fi



# Check the DEVICE_NAME value
if [ "$DEVICE_NAME" = "EU743" ]; then
  # open -a Simulator
  sleep 15
  xcrun simctl uninstall ED933923-98CE-4A5D-83AD-28D01C0BF757 com.freepartners.kilian
  flutter run -d ED933923-98CE-4A5D-83AD-28D01C0BF757
elif [ "$DEVICE_NAME" = "EU964" ]; then
  # open -a Simulator
  sleep 15
  xcrun simctl uninstall 626CA41B-EBD2-4293-A575-7538FC735A5F com.freepartners.kilian
  flutter run -d 626CA41B-EBD2-4293-A575-7538FC735A5F
else
  echo "Error: Invalid DEVICE_NAME."
  exit 1
fi


# 
