#Load Harmful Algal Bloom data. File pulled manually from http://sccoos.org/query/?project=Harmful%20Algal%20Blooms
#Data parameters = Harmul Algae Bloom; Cal Poly Pier; All; 15, Aug, 2008, 18 hour, 15 Minute; 28, Nov, 2015, 17 Hour, 33 Minute

HAB_Data <- read.csv(file ="HarmfulAlgalBlooms_2008_2016.csv", header = TRUE, sep = ",", na.strings = "NaN", skip = 7)
