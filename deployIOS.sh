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
flutter build ios --release

cd iOS

xcodebuild -workspace Runner.xcworkspace -scheme Runner -configuration Release -archivePath build/Runner.xcarchive archive

xcodebuild -exportArchive -archivePath build/Runner.xcarchive -exportOptionsPlist ../../kilian_deploy/ExportOptions.plist -exportPath build/Runner







xcrun simctl uninstall booted com.freepartners.kilian


# Variables
FTP_SERVER="yr3bv.ftp.infomaniak.com"
FTP_LOGIN="yr3bv_trichol"
FTP_PASSWORD="Taitai44!"
LOCAL_FILE=$HOME/Documents/WORKSPACE/kilian

# Upload file using curl
curl -T "$LOCAL_FILE" "ftp://$FTP_SERVER/" --user "$FTP_LOGIN:$FTP_PASSWORD"

# Check if upload was successful
if [ $? -eq 0 ]; then
  echo "File uploaded successfully to $FTP_SERVER"
else
  echo "Failed to upload file to $FTP_SERVER"
fi


# flutter run -d 626CA41B-EBD2-4293-A575-7538FC735A5F
