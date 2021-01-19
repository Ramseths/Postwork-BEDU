#Postwork Sesion 3 14/01/2021
#Jesus Ramseths Echeverria

#Utilizando el ultimo DF del Postwork anterior
str(dataTemporadas)
View(dataTemporadas)


# La probabilidad (marginal) de que el equipo que juega en casa anote x goles (x=0,1,2,)
golesCasa <- round(table(dataTemporadas$FTHG)/nrow(dataTemporadas),4)
# La probabilidad (marginal) de que el equipo que juega como visitante anote y goles (y=0,1,2,)
golesVisita <- round(table(dataTemporadas$FTAG)/nrow(dataTemporadas),4)
# La probabilidad (conjunta) de que el equipo que juega en casa anote x goles 
#y el equipo que juega como visitante anote y goles (x=0,1,2,, y=0,1,2,)
golesConjunta <- round(table(dataTemporadas$FTHG,dataTemporadas$FTAG)/nrow(dataTemporadas),4)

#2 Realiza lo siguiente:
#Un grafico de barras para las probabilidades marginales estimadas del numero de goles que anota el equipo de casa
