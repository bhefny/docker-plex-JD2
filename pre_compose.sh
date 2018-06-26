#!/usr/bin/env bash

# rm -Rf /home/bhefny/plex_content

MY_FOLDER=/mycontent
MY_PATH=~$MY_FOLDER
JD2_CONFIG=$MY_PATH/jd2
MYPLEX_MOVIE=$MY_PATH/plex/movie
MYPLEX_TV=$MY_PATH/plex/tv
MYPLEX_CONFIG=$MY_PATH/plex/config

if [[ $(cat /etc/mtab | grep $MY_FOLDER) ]]; then
    echo "-------- encfs 👍👍"
else
    # encfs ~/.encrypted ~/mycontent
    # fusermount -u ~/mycontent
    echo "----------- Failed to find encfs folder"
    exit 1
fi

# create .env file to be used in docker compose
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

echo "{\"password\":\"$JD2_password\", \"email\":\"$JD2_email\"}" > "$JD2_CONFIG/org.jdownloader.api.myjdownloader.MyJDownloaderSettings.json"
