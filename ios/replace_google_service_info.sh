#!/bin/sh

#  replace_google_service_info.sh
#  Runner
#
#  Created by 竹尾幸紘 on 2020/06/08.
#  

#! /bin/bash

if [[ $CONFIGURATION == *"Emulator"* ]]; then
    cp $SRCROOT/Runner/Firebase/GoogleService-Info-Development.plist $SRCROOT/Runner/GoogleService-Info.plist
elif [[ $CONFIGURATION == *"Development"* ]]; then
echo "${SRCROOT}"
    cp $SRCROOT/Runner/Firebase/GoogleService-Info-Development.plist $SRCROOT/Runner/GoogleService-Info.plist
elif [[ $CONFIGURATION == *"Staging"* ]]; then
    cp $SRCROOT/Runner/Firebase/GoogleService-Info-Staging.plist $SRCROOT/Runner/GoogleService-Info.plist
elif [[ $CONFIGURATION == *"Production"* ]]; then
    cp $SRCROOT/Runner/Firebase/GoogleService-Info-Production.plist $SRCROOT/Runner/GoogleService-Info.plist
elif [[ $CONFIGURATION == "Release" ]]; then
    echo "Might be CI archive"
else
    echo "configuration didn't match to Development, Staging or Production"
    echo $CONFIGURATION
    exit 1
fi
