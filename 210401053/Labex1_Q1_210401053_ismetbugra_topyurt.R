url <- "https://raw.githubusercontent.com/scizmeli/Red/master/MapsThatChangedOurWorld_StoryMap_Data.csv"
file_name <- "MapsThatChangedOurWorld_StoryMap_Data.csv"
download.file(url, destfile = file_name,mode="wb")

maps <- read.csv("MapsThatChangedOurWorld_StoryMap_Data.csv", sep = ";", header = TRUE)

maps$Latitude <- gsub("N", "", maps$Latitude)

idx <- grep("W", maps$Longitude)

maps$Longitude <- gsub("[EW]", "", maps$Longitude)

maps$Year <- gsub("AD", "", maps$Year)

maps$Latitude <- as.numeric(gsub("[NW]", "", maps$Latitude))
maps$Longitude <- as.numeric(gsub("[EW]", "", maps$Longitude))
