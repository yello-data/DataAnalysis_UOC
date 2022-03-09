#load packages
library(tidyverse)
library(ggmap)
library(readxl)

#read and tidy WDSF dataset (sheet 1)
wdsf89 <- read_xlsx("WDSF.xlsx", sheet = 1) %>% #read
  filter(year < 1990) %>%  #drop cases below 1990
  mutate(lat = as.numeric(lat), 
         lon = as.numeric(lon),
         relevance = 5 - relevance) #turn the numbers from 1 to 4, to 4 to 1.

#read and tidy WDSF dataset (sheet 2)
wdsf90 <- read_xlsx("WDSF.xlsx", sheet = 2) %>% #read
  filter(between(year, 1990, 1999)) %>%  #drop cases below 1990
  mutate(lat = as.numeric(lat), 
         lon = as.numeric(lon),
         relevance = 5 - relevance) #turn the numbers from 1 to 4, to 4 to 1.

#merge botg datasets
wdsf <- bind_rows(wdsf89, wdsf90, .id = "df") %>%
  mutate(df = recode(df, "1" = "Before 1990", "2" = "1900s"))

#save Rdata
save(wdsf, file = "wdsf.Rdata")

# To load the data again
load("wdsf.Rdata")


#Get the map
mapa_mundi <- get_stamenmap(bbox = c(top = 72.2,
                                     left = -160, right = 160.3,
                                     bottom = -60.1),
                              zoom = 2, 
                              maptype = "toner-lite")

#The map 1
ggmap(mapa_mundi,
      base_layer = ggplot(aes(x = lon, y = lat),
                          data = wdsf)) +
  geom_point(aes(col = topic, size = relevance),
             alpha = 0.5) + 
  scale_size_continuous(labels = c("Low", "Medium", "High", "Very High"))

#The map 2
ggmap(mapa_mundi,
      base_layer = ggplot(aes(x = lon, y = lat),
                          data = wdsf)) +
  geom_point(aes(col = df, size = relevance),
             alpha = 0.5) + 
  scale_size_continuous(labels = c("Low", "Medium", "High", "Very High"))


