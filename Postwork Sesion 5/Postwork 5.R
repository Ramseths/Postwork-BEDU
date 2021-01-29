#Postwork Sesion 5 21/01/2021
#Jesus Ramseths Echeverria Rivera

library(dplyr)
install.packages("fbRanks")
library(fbRanks)

# Comenzamos importando los datos que se encuentran en archivos csv a `R`

temporada1718 <- read.csv('https://www.football-data.co.uk/mmz4281/1718/SP1.csv')
temporada1819 <- read.csv('https://www.football-data.co.uk/mmz4281/1819/SP1.csv')
temporada1920 <- read.csv('https://www.football-data.co.uk/mmz4281/1920/SP1.csv')

# Ahora seleccionaremos únicamente las columnas `Date`, `HomeTeam`, `AwayTeam`, `FTHG`, `FTAG` y `FTR` en cada uno de los data frames. Primero guardaremos los data frames en una lista con nombre `lista` y después con ayuda de las funciones `lapply` y `select` (del paquete `dplyr`), seleccionaremos las columnas deseadas. Los nuevos data frames quedarán guardados en `nlista`.

lista <- list(temporada1718, temporada1819, temporada1920)
nlista <- lapply(lista, select, Date, HomeTeam, AwayTeam, FTHG, FTAG, FTR)


# Arreglamos las columnas `Date` para que `R` reconozca los elementos como fechas

nlista[[1]] <- mutate(nlista[[1]], Date = as.Date(Date, "%d/%m/%y"))
nlista[[2]] <- mutate(nlista[[2]], Date = as.Date(Date, "%d/%m/%Y"))
nlista[[3]] <- mutate(nlista[[3]], Date = as.Date(Date, "%d/%m/%Y"))

#Convertimos en un solo DF
data <- do.call(rbind, nlista)

# 1. Primero debemos crear el data frame `SmallData`, que contenga las columnas `date`, `home.team`, `home.score`, `away.team` y `away.score`; esto lo hacemos con ayuda de la función `select` del paquete `dplyr`. Luego establecemos un directorio de trabajo y con ayuda de la función `write.csv` guardamos nuestro data frame como un archivo csv con nombre *soccer.csv*.

SmallData <- select(data, date = Date, home.team = HomeTeam, 
                    home.score = FTHG, away.team = AwayTeam, 
                    away.score = FTAG)
setwd('c:/Users/ramze/Documents/Bedu')
write.csv(x = SmallData, file = "soccer.csv", row.names = FALSE)

# 2. Ahora con la función `create.fbRanks.dataframes` del paquete `fbRanks` importamos nuestro archivo *soccer.csv* a `R` y al mismo tiempo asignamos a una variable llamada `listasoccer`. Se creará una lista con los elementos `scores` y `teams` que son data frames listos para la función `rank.teams`. Asignamos estos data frames a variables llamadas `anotaciones` y `equipos`.

listasoccer <- create.fbRanks.dataframes(scores.file = "soccer.csv")
anotaciones <- listasoccer$scores
equipos <- listasoccer$teams

# 3. Ahora con ayuda de la función `unique` creamos un vector de fechas que no se repiten y que corresponde a las fechas en las que se jugaron partidos. Creamos una variable llamada `n` que contiene el número de fechas diferentes. Posteriormente, con la función `rank.teams` y usando como argumentos los data frames `anotaciones` y `equipos`, creamos un ranking de equipos usando unicamente datos desde la fecha inicial y hasta la penúltima fecha en la que se jugaron partidos, estas fechas las especificamos en `max.date` y `min.date`. Guardamos los resultados con el nombre `ranking`.

fecha <- unique(anotaciones$date)
n <- length(fecha)
ranking <- rank.teams(scores = anotaciones, teams = equipos,
                      max.date = fecha[n-1],
                      min.date = fecha[1])

# 4. Finalmente estimamos las probabilidades de los eventos 

pred <- predict(ranking, date = fecha[n])
