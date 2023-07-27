#!/bin/bash
#Incremental backup based on RSYNC - will copy FROM - TO only changed files
const FROM_FOLDER_PATH=
const TO_FOLDER_PATH=
rsync -avzh $FROM_FOLDER_PATH $TO_FOLDER_PATH
echo "Successfully did incremental backup from ${FROM_FOLDER_PATH} to ${$TO_FOLDER_PATH}"

