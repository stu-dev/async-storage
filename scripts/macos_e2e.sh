#!/bin/bash

RESOURCE_DIR="$PWD/example/ios/build/Build/Products/Release-macosx/ReactTestApp.app"
ENTRY_FILE="example/index.js"
BUNDLE_FILE="$RESOURCE_DIR/main.jsbundle"
EXTRA_PACKAGER_ARGS="--entry-file=$ENTRY_FILE --use-react-native-macos"
BUILD_ACTIONS="$@"

echo "[XCode e2e] Building macOS project"
export RCT_NO_LAUNCH_PACKAGER=true
xcodebuild \
  -project example/macos/AsyncStorageExample.xcworkspace \
  -scheme ReactTestApp \
  -configuration Release \
  -sdk macosx \
  -derivedDataPath example/macos/build \
  BUNDLE_FILE="$BUNDLE_FILE" \
  EXTRA_PACKAGER_ARGS="$EXTRA_PACKAGER_ARGS" \
  $BUILD_ACTIONS

exit $?
