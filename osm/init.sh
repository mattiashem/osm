echo "Sleep so postgress can start"


FILE=/status/imported
if [ -f "$FILE" ]; then
    echo "We have already run the import"
else 

sleep 30
echo "Setup postgress extension"
echo "Remove the status file "

psql -v ON_ERROR_STOP=1 <<EOF
CREATE EXTENSION postgis;
CREATE EXTENSION hstore;
ALTER TABLE geometry_columns OWNER TO _renderd;
ALTER TABLE spatial_ref_sys OWNER TO _renderd;
EOF

echo "Load data"
osm2pgsql -d gis --create --slim  -G --hstore --tag-transform-script /opt/src/openstreetmap-carto/openstreetmap-carto.lua -C 2500 --number-processes 1 -S /opt/src/openstreetmap-carto/openstreetmap-carto.style /opt/data/sweden-latest.osm.pbf



echo "Create index"
psql -d gis -f /opt/src/openstreetmap-carto/indexes.sql


echo "Setup external tools"
cp /opt/src/openstreetmap-carto/external-data.yml .
/opt/src/openstreetmap-carto/scripts/get-external-data.py
fi

echo "All done but keep up" >> /status/imported
tail -f /status