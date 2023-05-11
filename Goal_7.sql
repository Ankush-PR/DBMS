 buffer_areas AS (
  SELECT ST_Union(ST_Buffer(ST_Transform(geom, 3857), 500)) AS geom
  FROM public.geo_features
  WHERE amenity = 'cafe' AND building = 'yes'
)
SELECT ST_Area(ST_Transform(geom, 3857)) AS area_sq_meters
FROM buffer_areas;
WITH

CREATE INDEX idx_cuisine ON public.geo_features (cuisine);


SELECT gid, name, ST_AsText(geom) AS location
FROM public.geo_features
WHERE cuisine = 'coffee_shop'
LIMIT 10;
 buffer_areas AS (
  SELECT ST_Union(ST_Buffer(ST_Transform(geom, 3857), 500)) AS geom
  FROM public.geo_features
  WHERE amenity = 'cafe' AND building = 'yes'
)
SELECT ST_Area(ST_Transform(geom, 3857)) AS area_sq_meters
FROM buffer_areas;
WITH

CREATE INDEX idx_geo_features_geom ON public.geo_features USING gist(geom);


SELECT gid, name, ST_AsText(geom) AS location,
       ST_Distance(ST_Transform(geom, 3857), ST_Transform(ST_SetSRID(ST_Point(-74.0014, 40.7289), 4326), 3857)) AS distance_meters
FROM public.geo_features
WHERE amenity = 'cafe' AND ST_DWithin(ST_Transform(geom, 3857), ST_Transform(ST_SetSRID(ST_Point(-74.0014, 40.7289), 4326), 3857), 5000)
ORDER BY distance_meters ASC
LIMIT 5;
 buffer_areas AS (
  SELECT ST_Union(ST_Buffer(ST_Transform(geom, 3857), 500)) AS geom
  FROM public.geo_features
  WHERE amenity = 'cafe' AND building = 'yes'
)
SELECT ST_Area(ST_Transform(geom, 3857)) AS area_sq_meters
FROM buffer_areas;
WITH

CREATE INDEX idx_geo_features_geom ON public.geo_features USING gist(geom);

CREATE INDEX idx_cuisine ON public.geo_features (cuisine);
 buffer_areas AS (
  SELECT ST_Union(ST_Buffer(ST_Transform(geom, 3857), 500)) AS geom
  FROM public.geo_features
  WHERE amenity = 'cafe' AND building = 'yes'
)
SELECT ST_Area(ST_Transform(geom, 3857)) AS area_sq_meters
FROM buffer_areas;
WITH
