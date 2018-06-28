#!/usr/bin/env bash

# https://ubuntuforums.org/showthread.php?t=2391646

MY_FOLDER=/mycontent
MY_PATH=/home/bhefny$MY_FOLDER

if [[ $(cat /etc/mtab | grep $MY_FOLDER) ]]; then
    echo "-------- encfs 👍👍"
else
    # encfs -o allow_root /home/bhefny/.encrypted /home/bhefny/mycontent
    # fusermount -u /home/bhefny/mycontent
    echo "----------- Failed to find encfs folder"
    # exit 1
fi

# create file then append
echo "UID=$UID" > .env
echo "GID=$GID" >> .env

declare -A all_path=(
  ["JD2_CONFIG"]=$MY_PATH/jd2
  ["MYPLEX_CONFIG"]=$MY_PATH/plex/config
  ["MYPLEX_TV"]=$MY_PATH/plex/tv
  ["MYPLEX_MOVIE"]=$MY_PATH/plex/movie
  ["MYPLEX_ANIME"]=$MY_PATH/plex/anime
  ["MYPLEX_CARTOON_AR"]=$MY_PATH/plex/cartoon_ar
  )
for i in "${!all_path[@]}"
do
  # echo "$i=>${all_path[$i]}"
  mkdir -p ${all_path[$i]}
  echo "$i=${all_path[$i]}" >> .env
done


if [ -z "$JD2_password" ]; then
    echo "----------- Failed to find MyJDownloader ENV"
    exit 1
fi

echo "{\"password\":\"$JD2_password\", \"email\":\"$JD2_email\"}" > "${all_path['JD2_CONFIG']}/org.jdownloader.api.myjdownloader.MyJDownloaderSettings.json"
