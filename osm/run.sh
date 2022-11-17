#!/bin/bash
 echo "Start up osm server"
while [ ! -f /status/imported ]
do
  sleep 5 # or less like 0.2
  echo "Import is not done chlling"
done

echo "Starting up"
#Startup render
/usr/bin/renderd -f &
#Start apache 
apachectl -D FOREGROUND
