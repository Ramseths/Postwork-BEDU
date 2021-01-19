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
library(ggplot2)
library(dplyr)
dfGolesCasa <- as.data.frame(golesCasa)
dfGolesVisita <- as.data.frame(golesVisita)
dfGolesCasa <- rename(dfGolesCasa, Goles = Var1, Probabilidad = Freq)
dfGolesVisita <- rename(dfGolesVisita, Goles = Var1, Probabilidad = Freq)
graficoCasa <- ggplot(dfGolesCasa, aes(x = Goles, y = Probabilidad)) + 
  geom_bar (stat="identity", fill = 'red') +
  ggtitle('Equipo Casa')
graficoCasa

#Un grafico de barras para las probabilidades marginales estimadas del numero de goles que anota el equipo visitante.
graficoVisitante <- ggplot(dfGolesVisita, aes(x = Goles, y = Probabilidad)) + 
  geom_bar (stat="identity", fill = 'red') +
  ggtitle('Equipo Visitante')
graficoVisitante


#Un HeatMap para las probabilidades conjuntas estimadas de los numeros de goles que anotan el equipo de 
#casa y el equipo visitante en un partido.
dfGolesConjuntas <- as.data.frame(golesConjunta)
dfGolesConjuntas <- rename(dfGolesConjuntas, GolesCasa = Var1, GolesVisita = Var2, Probabilidad = Freq)

ggplot(dfGolesConjuntas,aes(GolesCasa, GolesVisita)) + 
  geom_tile(aes(fill = Probabilidad)) + 
  ggtitle('Probabilidades Conjuntas')
