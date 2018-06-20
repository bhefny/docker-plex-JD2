#!/usr/bin/env bash

# rm -Rf /home/bhefny/plex_content

JD2_CONFIG=/home/bhefny/jd2_config
MYPLEX_MOVIE=/home/bhefny/plex_content/movie
MYPLEX_TV=/home/bhefny/plex_content/tv
MYPLEX_CONFIG=/home/bhefny/plex_content/config

echo "JD2_CONFIG=$JD2_CONFIG" > .env
echo "MYPLEX_MOVIE=$MYPLEX_MOVIE" >> .env
echo "MYPLEX_TV=$MYPLEX_TV" >> .env
echo "MYPLEX_CONFIG=$MYPLEX_CONFIG" >> .env
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
