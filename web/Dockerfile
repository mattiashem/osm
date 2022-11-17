from nginx

#Install leaflet for isplat map
RUN apt-get update && apt-get install wget -y 
WORKDIR /usr/share/nginx/html
RUN wget https://raw.githubusercontent.com/SomeoneElseOSM/mod_tile/switch2osm/extra/sample_leaflet.html
RUN mv sample_leaflet.html index.html
RUN sed -i 's/127\.0\.0\.1/localhost:8080/g' index.html
