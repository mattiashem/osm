FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update && apt install screen locate libapache2-mod-tile renderd git \
    tar unzip wget bzip2 apache2 lua5.1 mapnik-utils python3-mapnik python3-psycopg2 \
    python3-yaml gdal-bin npm fonts-noto-cjk fonts-noto-hinted fonts-noto-unhinted \
    fonts-unifont fonts-hanazono postgresql postgresql-contrib postgis postgresql-14-postgis-3 postgresql-14-postgis-3-scripts \
    osm2pgsql net-tools curl -y



#
RUN mkdir /opt/src
RUN cd /opt/src
WORKDIR /opt/src
RUN git clone https://github.com/gravitystorm/openstreetmap-carto
WORKDIR /opt/src/openstreetmap-carto/
RUN npm install -g carto
RUN ls -l
RUN carto project.mml > mapnik.xml




#Load data
RUN mkdir /opt/data
RUN cd /opt/data
WORKDIR /opt/data
RUN wget https://download.geofabrik.de/europe/sweden-latest.osm.pbf


#Render
COPY renderd.conf /etc/renderd.conf
RUN mkdir /run/renderd


RUN mkdir /entrypoint
COPY run.sh /entrypoint
COPY init.sh /entrypoint
RUN chmod +x /entrypoint/*.sh





CMD /entrypoint/run.sh