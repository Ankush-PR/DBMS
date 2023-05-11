# DBMS
Step 0: Install Postgis and Enable it on Postgres
Created a new PostgreSQL database and enable the PostGIS extension:<br><br>
![Screenshot 2023-05-10 at 9 34 32 PM](https://github.com/Astroboyag/DBMS/assets/46861452/df7d10f8-1a95-4e8c-be07-1c8a13574d57)<br><br>
Step 1: Get the Data from an online source.

To download OSM data in the desired format, follow these steps:

1) Go to the Overpass Turbo website: https://overpass-turbo.eu/
2) In the top left corner, click the "Wizard" button.
3) Enter a search query to filter the data based on your project's needs. For example, you can search for specific types of points of interest like "amenity=cafe" to retrieve all cafes in the current map view.
4) Click "Build and Run Query" to execute the query.
5) Once the query is completed, the map will show the matching features. You can pan and zoom to adjust the area of interest.
6) Click the "Export" button in the top right corner.
7) Choose the desired format (GeoJSON or KML) and click "download."

Downloaded all data for cafes in New York City Area in GeoJSON format. Used the following query: <br><br>
<img width="623" alt="Screenshot 2023-05-10 at 9 40 02 PM" src="https://github.com/Astroboyag/DBMS/assets/46861452/16c0196f-4a3c-44fe-ae73-56312fbe0fbe"><br><br>
Step 2: Get the Data from an online source.

Then we imported the data using the following command:

ogr2ogr -f "PostgreSQL" PG:"dbname=gis_analysis user=postgres host=/var/run/postgresql port=5432" "/home/ubuntu/export.geojson" -nln public.geo_features -lco GEOMETRY_NAME=geom -lco FID=gid -lco PRECISION=NO -nlt PROMOTE_TO_MULTI -a_srs EPSG:4326

Goals

Goal 1: Retrieve Locations of specific features

We retreived cafe which are marked as coffee_shop as cuisine. We used the following query for the same:

SELECT gid, name, ST_AsText(geom) AS location
FROM public.geo_features
WHERE cuisine = 'coffee_shop' LIMIT 10;

Below is the output:<br><br>

![Screenshot 2023-05-10 at 9 34 32 PM](https://github.com/Astroboyag/DBMS/assets/46861452/87956469-e275-4e70-b7c4-e8146e8a6800)


