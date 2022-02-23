#!/bin/bash

set -eu


if [ "${1-default}" == "--clean" ]; then
    rm -rf ToDoApp.xcodeproj
fi

./download-tools.sh
./bin/xcodegen/bin/xcodegen generate

if [ "${1-default}" == "--clean" ]; then
    xcodebuild -alltargets clean
fi




