#Get Data from http://coastwatch.pfeg.noaa.gov/erddap/tabledap/scrippsGliders.html
urlfile <- 'http://coastwatch.pfeg.noaa.gov/erddap/tabledap/scrippsGliders.csv?trajectory%2Cinstitution%2Cplatform_id%2Cplatform_type%2Cwmo_id%2Cctd_make_model%2Csegment_id%2Ctime_uv%2Clat_uv%2Clon_uv%2Cu%2Cv%2Cuv_qc%2Cprofile_id%2Cprofile_qc%2Ctime%2Clatitude%2Clongitude%2Cdepth%2Cpressure%2Ctemperature%2Csalinity%2Cconductivity%2Cprecise_time%2Cprecise_time_qc%2Cprecise_lat%2Cprecise_lat_qc%2Cprecise_lon%2Cprecise_lon_qc&trajectory=%22sp031-20140405%22'
scrippsGlidersData <- read.csv(urlfile)
write.csv(scrippsGlidersData, file = "scrippsGlidersData.csv")

#Explore data raw
head(scrippsGlidersData)
summary(scrippsGlidersData)
str(scrippsGlidersData)

#Copy data for manipulation
scrippsGlidersData2 <- scrippsGlidersData[-1,]

#Convert Factors to Numeric
scrippsGlidersData2$latitude <- as.numeric(as.character(scrippsGlidersData2$latitude))
scrippsGlidersData2$longitude <- as.numeric(as.character(scrippsGlidersData2$longitude))
scrippsGlidersData2$depth <- as.numeric(as.character(scrippsGlidersData2$depth))
scrippsGlidersData2$pressure <- as.numeric(as.character(scrippsGlidersData2$pressure))
scrippsGlidersData2$temperature <- as.numeric(as.character(scrippsGlidersData2$temperature))
scrippsGlidersData2$salinity <- as.numeric(as.character(scrippsGlidersData2$salinity))
scrippsGlidersData2$conductivity <- as.numeric(as.character(scrippsGlidersData2$conductivity))

#Save Converted File
write.csv(scrippsGlidersData2, file = "scrippsGlidersData2.csv")

#Emplore Data visually
#Plot Lat & Long
library(ggplot2)
library(ggmap)

latlon <- as.data.frame(cbind(scrippsGlidersData2$longitude,scrippsGlidersData2$latitude))
colnames(latlon) <- c("lon","lat")

maplatlon <- get_map(location = c(lon = mean(latlon$lon)+10, lat = mean(latlon$lat)), zoom = 5,
                      maptype = "satellite", scale = 2)

ggmap(mapscrippsGliderData2) +
  geom_point(data = latlon, aes(x = lon, y = lat, fill = "red", alpha = 0.8), size = 1, shape = 21) +
  guides(fill=FALSE, alpha=FALSE, size=FALSE)
