cd $HOME/Documents/WORKSPACE
rm -rf kilian_deploy
git clone https://github.com/trichol/kilian_deploy.git
git log --oneline -5

cd $HOME/Documents/WORKSPACE/kilian
git reset --hard HEAD
git pull
git log --oneline -5



rm -rf $HOME/Documents/WORKSPACE/kilian/ios/Runner/Assets.xcassets


cp -R  $HOME/Documents/WORKSPACE/kilian_image/Assets.xcassets   $HOME/Documents/WORKSPACE/kilian/ios/Runner/Assets.xcassets


xcrun simctl uninstall booted com.freepartners.kilian
flutter run -d 626CA41B-EBD2-4293-A575-7538FC735A5F