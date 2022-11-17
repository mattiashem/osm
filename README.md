# OSM Maps

Maps server that start up Openstreat map server and using a external postgress


## Content


### import-tiles 
- Init the postgres SQL server !
- Import sweden as tile 
- Import some extra scripts and resource

After the setup and install the impoter will come in zoombi state and only tail a file


### osm
Will run the renderd service and apache server to send the tiles to the mapservice.
The container will sit and wait untill the import is done and then start up.

- Run renderd
- Run Aapche server


You can easy get a tile with the curl 

```
curl -c http://localhost:8080/hot/0/0/0.png
```


### web
The webb will run the web javascript and connect to the osm server.
It will then displat the map to use.


```
you can find the web on http://localhost:8081 
```

The webb will connect to osm and get the tiles needed when browsing the map


## Status
the status folder is used to set the state. I file will be created there called import.
then the files id there osm will start.
If you wnat to import new files 

YOU MUST DELETE THE FILE

```
rm status/*
```

## HARD CODED
Its all hardcoded now. Dont fiddel around in the docker-compose things will breake.




