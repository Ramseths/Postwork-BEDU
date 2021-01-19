#POSTWORK 1 07/01/2021
#Jesus Ramseths Echeverria

#Leemos los datos
datos <- read.csv("https://www.football-data.co.uk/mmz4281/1920/SP1.csv")
datos$FTHG
datos$FTAG 

#Probabilidades Marginales Estimadas
golesCasa <- table(datos$FTHG)/nrow(datos)
golesVisita <- table(datos$FTAG)/nrow(datos)
#Probabildades conjuntas
golesConjuntos <- table(datos$FTHG, datos$FTAG)/nrow(datos)
