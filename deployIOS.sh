clear

#!/bin/bash

# Replace this with the actual device name
DEVICE_NAME=$(hostname) # Example: Get device name from the system (can be customized)

# Construct the file path
PROJECT_FILE_PATH=$HOME/Documents/WORKSPACE/kilian_deploy/project${DEVICE_NAME}.pbxproj

# Check if the file exists
if [ ! -f "$PROJECT_FILE_PATH" ]; then
  echo "Error: File '$PROJECT_FILE_PATH' does not exist." >&2
  exit 1
else
  echo "File '$PROJECT_FILE_PATH' exists."
fi


#!/bin/bash

# Check if an argument is provided
# if [ -z "$1" ]; then
#  echo "Error: Missing build number argument."
#  echo "Usage: ./update_version.sh <build_number>"
#  exit 1
# fi

# Argument passed as the build number
# BUILD_NUMBER=$1

# Path to pubspec.yaml
PUBSPEC_FILE=$HOME/Documents/WORKSPACE/kilian/pubspec.yaml

# Check if pubspec.yaml exists
if [ ! -f "$PUBSPEC_FILE" ]; then
  echo "Error: pubspec.yaml not found in the current directory."
  exit 1
fi

cd $HOME/Documents/WORKSPACE/kilian


git status



rm -rf  .DS_Store
rm -rf  .dart_tool/
rm -rf  .flutter-plugins
rm -rf  .flutter-plugins-dependencies
rm -rf  .idea/
rm -rf  build/
rm -rf  ios/.DS_Store
rm -rf  ios/Podfile.lock
rm -rf  ios/Runner/.DS_Store
rm -rf  ios/Runner/Assets.xcassets/.DS_Store
rm -rf  pubspec.lock




git reset --hard HEAD
git pull
git log --oneline -5

# Update the version field in pubspec.yaml
# sed -i.bak -E "s/^version: ([0-9]+\.[0-9]+\.[0-9]+)\+[0-9]+/version: \1+$BUILD_NUMBER/" "$PUBSPEC_FILE"

# Check if the update was successful
# if [ $? -eq 0 ]; then
#  echo "Version updated successfully in pubspec.yaml to include build number: $BUILD_NUMBER"
#  echo "Backup created as pubspec.yaml.bak"
# else
#  echo "Error: Failed to update version in pubspec.yaml."
#  exit 1
# fi

cp -rf $PROJECT_FILE_PATH $HOME/Documents/WORKSPACE/kilian/ios/Runner.xcodeproj/project.pbxproj

git status
# open iOS/Runner.xcodeproj

# exit

flutter doctor
flutter pub get
flutter clean
pod install
flutter pub get
rm -rf $HOME/Documents/WORKSPACE/kilian/ios/Runner/Assets.xcassets/AppIcon.appiconset
cp -R  $HOME/Documents/WORKSPACE/kilian_deploy/AppIcon.appiconset     $HOME/Documents/WORKSPACE/kilian/ios/Runner/Assets.xcassets/
cp -R  $HOME/Documents/WORKSPACE/kilian_deploy/Runner.entitlements     $HOME/Documents/WORKSPACE/kilian/ios/Runner/Runner.entitlements
cp -R  $HOME/Documents/WORKSPACE/kilian_deploy/info.plist    $HOME/Documents/WORKSPACE/kilian/ios/Runner/info.plist
flutter build ios --release

cd iOS

xcodebuild -workspace Runner.xcworkspace -scheme Runner -configuration Release -archivePath build/Runner.xcarchive archive

xcodebuild -exportArchive -archivePath build/Runner.xcarchive -exportOptionsPlist ../../kilian_deploy/ExportOptions${DEVICE_NAME}.plist -exportPath build/exported

xcrun altool --upload-app   --type ios   --file build/exported/kilian.ipa  --username "thierry.richol@freepartner.fr"   --password "ixik-vvas-jobp-dlhf"
