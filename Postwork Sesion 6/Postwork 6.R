#Postwork Sesion 6 26/01/2021
#Jesus Ramseths Echeverria Rivera

library(dplyr)
setwd('c:/Users/ramze/Documents/Bedu/Sesion6/')
##Leemos el archivo
data <- read.csv("match.data.csv")


# Agregamos la columna `sumagoles` y obtenemos el promedio por mes de la suma de goles

data2 <- data %>% 
  mutate(date = as.Date(date, "%Y-%m-%d"),
         sumagoles = home.score + away.score) %>%
  mutate(Ames = format(date, "%Y-%m")) %>%
  group_by(Ames) 

#Obtenemos el promedio por mes
data2 %>%
  summarise(promgoles = mean(sumagoles))
(dataR <- as.data.frame(data2))

#Hacemos un filtro
(dataR <- dataR %>% filter(Ames != "2013-06"))
(dataR <- dataR[1:95,])



# Creamos nuestra serie de tiempo
library(TSA)
(promgoles <- ts(dataR$sumagoles, start = 1,
                 frequency = 10))
ts.plot(promgoles)


