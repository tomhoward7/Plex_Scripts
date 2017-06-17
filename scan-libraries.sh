!/bin/sh
###############################################################################
# scanlibraries - Scan plex libraries for new files
###############################################################################
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/usr/lib/plexmediaserver"
export PLEX_MEDIA_SERVER_HOME="/usr/lib/plexmediaserver"
export PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR="/var/lib/plexmediaserver/Library/Application Support"
cache_dir="${HOME}/.cache/nimbostratus"
###############################################################################
movie_category="3"
movie_directory="/mnt/plexdrive/Film"
tv_category="4"
tv_directory="/mnt/plexdrive/TV"

if [ ! -d "$cache_dir" ]; then
        mkdir -p "$cache_dir"
fi


if [ ! -f "${cache_dir}/lastrun" ]; then
        find_options=""
else
        find_options="-cnewer ${cache_dir}/lastrun"
fi

echo "############ Movie scan started ############"
#find ${movie_directory} -mindepth 1 -type d |
#while read d; do
        echo "Scanning directory: $d"
        ${PLEX_MEDIA_SERVER_HOME}/Plex\ Media\ Scanner -s -r -c "$movie_category" -d "$movie_directory"
#done

echo "############## TV scan started ##############"
#find ${tv_directory} -mindepth 2 -type d ${find_options} |
#while read d; do
        echo "Scanning directory: $d"
        ${PLEX_MEDIA_SERVER_HOME}/Plex\ Media\ Scanner -s -r -c "$tv_category" -d "$tv_directory"
#done

touch ${cache_dir}/lastrun

exit
