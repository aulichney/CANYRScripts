# CANY RScripts

## Map
- GeoJsonFile.R creates the geojson file for the map component of the Under Custody dashboard using census data, under custody data, and economic/unemployment data. Output is a geojson. Input is annie2.json. 
- Convertbasemap.R converted an initial geojson file with less detailed coastlines into a more detailed one maintaining structure needed to input it into GeoJsonFile.R
- output.geojson is example of what is outputted to be inputted into the dashboard


## UnderCustody
- UnderCustodyGeo.R cleans and processes under custody data. Bins time variables, changes race/ethnicity keys, smaller format changes. Example outputs also included
