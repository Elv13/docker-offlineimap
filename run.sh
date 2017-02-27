#! /bin/sh

sed -i "s/YOUR_EMAIL/$EMAIL/" /home/offlineimap/.offlineimaprc
sed -i "s/YOUR_CLIENT_ID/$CLIENT_ID/" /home/offlineimap/.offlineimaprc
sed -i "s/YOUR_ACCESS_TOKEN/$ACCESS_TOKEN/" /home/offlineimap/.offlineimaprc
sed -i "s=YOUR_SECRET=$SECRET=" /home/offlineimap/.offlineimaprc

exec offlineimap -c /home/offlineimap/.offlineimaprc
