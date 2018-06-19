#!/usr/bin/env bash

# rm -Rf /home/bhefny/plex_content


# export JD2_email=""
# export JD2_password=""
source .env_vars

mkdir -p $MYPLEX_MOVIE
mkdir -p $MYPLEX_TV
mkdir -p $MYPLEX_CONFIG
mkdir -p $JD2_CONFIG

echo "{'password':'$JD2_password', 'email':'$JD2_email'}" > "$JD2_CONFIG/org.jdownloader.api.myjdownloader.MyJDownloaderSettings.json"
