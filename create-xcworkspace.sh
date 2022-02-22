#!/bin/bash

set -eu


if [ "${1-default}" == "--clean" ]; then
    rm -rf To-Do App.xcodeproj
    rm -rf To-Do App.xcworkspace
fi

./download-tools.sh
./bin/xcodegen/bin/xcodegen generate

if [ "${1-default}" == "--clean" ]; then
    xcodebuild -alltargets clean
fi
bundle install
bundle exec pod install
cp IDETemplateMacros.plist To-Do App.xcodeproj/xcshareddata/.



