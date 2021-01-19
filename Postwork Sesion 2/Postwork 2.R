#POSTWORK 2 12/01/2021
#Jesus Ramseths Echeverria Rivera

#1.Importa los datos de soccer de las temporadas 2017/2018, 2018/2019 y 2019/2020 de la primera division de la liga española a R

temporada1718 <- read.csv('https://www.football-data.co.uk/mmz4281/1718/SP1.csv')
temporada1819 <- read.csv('https://www.football-data.co.uk/mmz4281/1819/SP1.csv')
temporada1920 <- read.csv('https://www.football-data.co.uk/mmz4281/1920/SP1.csv')

#2. Obten una mejor idea de las caracteristicas de los data frames al usar las funciones: str, head, View y summary
str(temporada1718); str(temporada1819); str(temporada1920);
head(temporada1718);head(temporada1819);head(temporada1920);
View(temporada1718); View(temporada1819); View(temporada1920);
summary(temporada1718); summary(temporada1819); summary(temporada1920);

#3. Con la funcion select del paquete dplyr selecciona únicamente las columnas Date, HomeTeam, AwayTeam, FTHG, FTAG y FTR; 
library(dplyr)
temporadas <- list(temporada1718,temporada1819,temporada1920);
temporadas2 <- lapply(temporadas, select, Date, HomeTeam, AwayTeam, FTHG, FTAG, FTR);

#4 Asegurate de que los elementos de las columnas correspondientes de los nuevos data frames sean del mismo tipo
temporadas2[[1]] <- mutate(temporadas2[[1]], Date = as.Date(Date, "%d/%m/%y"))
temporadas2[[2]] <- mutate(temporadas2[[2]], Date = as.Date(Date, "%d/%m/%y"))
temporadas2[[3]] <- mutate(temporadas2[[3]], Date = as.Date(Date, "%d/%m/%y"))

#Formar un solo DF
dataTemporadas <- do.call(rbind, temporadas2)
