library(rgdal)
setwd("/Users/annieulichney/Desktop")
cntyS<-rgdal::readOGR('./NYS_Civil_Boundaries_SHP/',layer="Counties_Shoreline")
annie <- rgdal::readOGR('output.geojson')
#plot(annie)
anniesProj <- proj4string(annie)
cntySannieProj <- spTransform(cntyS,CRS(anniesProj))

# cntySannieProj@data$nameStr <- levels(cntySannieProj@data$NAME)[cntySannieProj@data$NAME]
# class(annie@data$name)
# annie@data$nameStr <- levels(annie@data$name)[annie@data$name]

for(j in 1:ncol(annie@data)){
    cntySannieProj@data[,j+15] <- annie@data[,j][match(cntySannieProj@data$NAME,annie@data$name)]
}
colnames(cntySannieProj@data)[15] <- "nameStr1"

#store names as name
cntySannieProj@data$name <- cntySannieProj@data$NAME

#eliminate unneeded values
cntySannieProj@data$Shape_Area <- NULL
cntySannieProj@data$NAME <- NULL
cntySannieProj@data$ABBREV <- NULL
cntySannieProj@data$GNIS_ID <- NULL
cntySannieProj@data$POP1990 <- NULL
cntySannieProj@data$POP2000 <- NULL
cntySannieProj@data$POP2010 <- NULL
cntySannieProj@data$POP2020 <- NULL
cntySannieProj@data$NYC <- NULL
cntySannieProj@data$SP_ZONE <- NULL                  
cntySannieProj@data$DOS_LL <- NULL                             
cntySannieProj@data$DATEMOD <- NULL                                               
cntySannieProj@data$COUNTYFIPS <- NULL                                            
cntySannieProj@data$SWIS <- NULL                                                  
cntySannieProj@data$CALC_SqMi <- NULL                                             
cntySannieProj@data$nameStr1 <- NULL  
cntySannieProj@data$V18 <- NULL 
cntySannieProj@data$V19 <- NULL
cntySannieProj@data$V20 <- NULL
cntySannieProj@data$V21 <- NULL
cntySannieProj@data$V22 <- NULL
cntySannieProj@data$V23 <- NULL
cntySannieProj@data$V24 <- NULL
cntySannieProj@data$V25 <- NULL
cntySannieProj@data$V26 <- NULL
cntySannieProj@data$V27 <- NULL
cntySannieProj@data$V28 <- NULL
cntySannieProj@data$V29 <- NULL
cntySannieProj@data$V30 <- NULL
cntySannieProj@data$V31 <- NULL
cntySannieProj@data$V32 <- NULL
cntySannieProj@data$V33 <- NULL
cntySannieProj@data$V34 <- NULL
cntySannieProj@data$V35 <- NULL
cntySannieProj@data$V36 <- NULL
cntySannieProj@data$V37 <- NULL
cntySannieProj@data$V38 <- NULL
cntySannieProj@data$V39 <- NULL
cntySannieProj@data$V40 <- NULL
cntySannieProj@data$V41 <- NULL
cntySannieProj@data$V42 <- NULL
cntySannieProj@data$V43 <- NULL
cntySannieProj@data$V44 <- NULL
cntySannieProj@data$V45 <- NULL
cntySannieProj@data$V46 <- NULL
cntySannieProj@data$V47 <- NULL
cntySannieProj@data$V48 <- NULL
cntySannieProj@data$V49 <- NULL
cntySannieProj@data$V50 <- NULL
cntySannieProj@data$V51 <- NULL
cntySannieProj@data$Shape_Leng <- NULL
cntySannieProj@data$DOSLL_DATE<- NULL
cntySannieProj@data$CALC_SQ_MI<- NULL


library(geojsonio)
annie2 <- geojson_json(cntySannieProj)
geojson_write(annie2, file = "./annie2.json")
rgdal::writeOGR(obj=cntySannieProj,dsn = './geoJSON',layer='annie2.json',driver = "GeoJSON")

a2 <- rgdal::readOGR("annie2.json")

plot(a2)