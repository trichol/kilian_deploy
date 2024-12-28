# cd $HOME/Documents/WORKSPACE/kilian_deploy
# git reset --hard HEAD
# git pull
# git log --oneline -5





cd $HOME/Documents/WORKSPACE/kilian
git reset --hard HEAD
git pull
git log --oneline -5



 rm -rf $HOME/Documents/WORKSPACE/kilian/ios/Runner/Assets.xcassets/AppIcon.appiconset

 cp -R  $HOME/Documents/WORKSPACE/kilian_deploy/AppIcon.appiconset     $HOME/Documents/WORKSPACE/kilian/ios/Runner/Assets.xcassets/


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
