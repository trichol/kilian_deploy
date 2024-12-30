clear


#!/bin/bash

# Check if an argument is provided
if [ -z "$1" ]; then
  echo "Error: No input provided."
  echo "Usage: $0 <input>"
  exit 1
fi

# Assign the input to a variable
input=$1


cd $HOME/Documents/WORKSPACE/kilian

git reset --hard HEAD
git pull
git log --oneline -5

killall Simulator


flutter doctor
flutter pub get
flutter clean
pod install
flutter pub get
rm -rf $HOME/Documents/WORKSPACE/kilian/ios/Runner/Assets.xcassets/AppIcon.appiconset
cp -R  $HOME/Documents/WORKSPACE/kilian_deploy/AppIcon.appiconset     $HOME/Documents/WORKSPACE/kilian/ios/Runner/Assets.xcassets/


# Check the input value
if [ "$input" = "EU743" ]; then
  open -a Simulator
  sleep 15
  xcrun simctl uninstall ED933923-98CE-4A5D-83AD-28D01C0BF757 com.freepartners.kilian
  flutter run -d ED933923-98CE-4A5D-83AD-28D01C0BF757
elif [ "$input" = "EU964" ]; then
  open -a Simulator
  sleep 15
  xcrun simctl uninstall 626CA41B-EBD2-4293-A575-7538FC735A5F com.freepartners.kilian
  flutter run -d 626CA41B-EBD2-4293-A575-7538FC735A5F
else
  echo "Error: Invalid input."
  exit 1
fi


# 
