#!/usr/bin/env bash

# rm -Rf /home/bhefny/plex_content

source .env_vars

cat .env_vars > .env
echo "GID=$GID" >> .env
echo "UID=$UID" >> .env

mkdir -p $MYPLEX_MOVIE
mkdir -p $MYPLEX_TV
mkdir -p $MYPLEX_CONFIG
mkdir -p $JD2_CONFIG

if [ -z "$JD2_password" ]; then
    echo "----------- Failed to find MyJDownloader ENV"
    exit 1
fi

echo "{'password':'$JD2_password', 'email':'$JD2_email'}" > "$JD2_CONFIG/org.jdownloader.api.myjdownloader.MyJDownloaderSettings.json"
