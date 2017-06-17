#touch /root/"running1-plex-on-startup$(date)"
sudo umount -l /mnt/plexdrive
chown plex:plex /mnt/plexdrive
/plexdrive-linux-amd64 /mnt/plexdrive -o allow_other &
#touch /root/"running2-plex-on-startup$(date)"
