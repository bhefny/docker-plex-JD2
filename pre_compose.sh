#!/usr/bin/env bash

# export JD2_email=""
# export JD2_password=""
export JD2_CONFIG="/home/bhefny/jd2_config"
export MYPLEX_MOVIE="/home/bhefny/plex_content/movie"
export MYPLEX_TV="/home/bhefny/plex_content/tv"
export MYPLEX_CONFIG="/home/bhefny/plex_content/config"
export GID=$(cat /etc/group | grep "^$USER" | awk -F':' '{print $3}')

echo "{'password':'$JD2_password', 'email':'$JD2_email'}" > "$JD2_CONFIG/org.jdownloader.api.myjdownloader.MyJDownloaderSettings.json"

###########
# Cleanup #
###########

# rm -Rf /home/bhefny/plex_content
mkdir -p $MYPLEX_MOVIE
mkdir -p $MYPLEX_TV
mkdir -p $MYPLEX_CONFIG
mkdir -p $JD2_CONFIG
