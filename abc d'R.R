
#Quins paquets he d'instal·lar?
install.packages(c("tidyverse", "haven", "foreign", "countrycode"))

#nota: tidyverse conté dplyr, ggplot2, readr, stringr i altres.
tidyverse::tidyverse_packages() #veure paquets de tidyverse

#Quins paquets tinc instal·lats?
installed.packages() #marc de dades sencer
installed.packages()[,3] #versió
names(installed.packages()[,1]) #llista de noms

#Com carrego els paquets?
library(dplyr)
library(ggplot2)
library(readxl)

#Quins paquets tinc carregats?
search()

#Com creo un objecte a l'Environment?
a <- 1

#Quins objectes tinc a l'Environment?
ls()

#Com elimino un objecte de l'Environment?
rm(a)
rm(a, b, c)
rm(list = ls())
