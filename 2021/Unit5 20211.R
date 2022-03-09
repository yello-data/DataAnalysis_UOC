#PACKAGES
library(tidyverse)
library(readxl)
library(leaflet)

#AIRWARS, EXCEL DOWNLOAD
somalia <- read_xlsx("Airwars.xlsx", sheet = 4)

#AIRWARS, RDATA DOWNLOAD ----ONLY IF THE EXCEL OPTION DOES NOT WORK-----
load("airwars.Rdata")

#Explore
glimpse(somalia)

barplot(table(somalia$XXXXXXXX))

##Maps
somalia %>%
# filter(variable == XXXXXX) %>% 
  leaflet() %>%
  addTiles() %>%
  addCircleMarkers(lng = ~longitude, 
                   lat = ~latitude)


#QUALITY OF GOVERNMENT
qog <- read_csv("https://www.qogdata.pol.gu.se/data/qog_bas_cs_jan21.csv")
plot(qog$bci_bci)
summary(qog$wvs_psdem)
