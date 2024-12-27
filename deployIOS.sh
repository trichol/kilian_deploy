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
# flutter run -d 626CA41B-EBD2-4293-A575-7538FC735A5F
