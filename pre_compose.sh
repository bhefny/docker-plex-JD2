#!/usr/bin/env bash

# rm -Rf /home/bhefny/plex_content

source .env_vars

cat .env_vars > .env
echo "GID=$GID" >> .env
echo "UID=$UID" >> .env
sort -u .env > .env

mkdir -p $MYPLEX_MOVIE
mkdir -p $MYPLEX_TV
mkdir -p $MYPLEX_CONFIG
mkdir -p $JD2_CONFIG

echo "{'password':'$JD2_password', 'email':'$JD2_email'}" > "$JD2_CONFIG/org.jdownloader.api.myjdownloader.MyJDownloaderSettings.json"
