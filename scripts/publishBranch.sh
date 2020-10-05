echo "Start publishBranch Pipeline"
echo "==============================="
source /usr/local/rvm/scripts/rvm
echo "Clean Project"
fastlane clean
echo "Package Project"
fastlane apk