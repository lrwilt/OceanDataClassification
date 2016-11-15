#Get Data from http://coastwatch.pfeg.noaa.gov/erddap/tabledap/scrippsGliders.html
urlfile <- 'http://coastwatch.pfeg.noaa.gov/erddap/tabledap/scrippsGliders.csv?trajectory%2Cinstitution%2Cplatform_id%2Cplatform_type%2Cwmo_id%2Cctd_make_model%2Csegment_id%2Ctime_uv%2Clat_uv%2Clon_uv%2Cu%2Cv%2Cuv_qc%2Cprofile_id%2Cprofile_qc%2Ctime%2Clatitude%2Clongitude%2Cdepth%2Cpressure%2Ctemperature%2Csalinity%2Cconductivity%2Cprecise_time%2Cprecise_time_qc%2Cprecise_lat%2Cprecise_lat_qc%2Cprecise_lon%2Cprecise_lon_qc&trajectory=%22sp031-20140405%22'
scrippsGlidersData <- read.csv(urlfile)
write.csv(scrippsGlidersData, file = "scrippsGlidersData.csv")
