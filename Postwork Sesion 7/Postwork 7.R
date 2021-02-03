#Postwork Sesion 7 28/01/2021
#Jesus Ramseths Echeverria Rivera

library(mongolite)

#Realizando conexion
match <- mongo(collection = "match", db="match_games", url = "mongodb+srv://HDRAMSETHS:<password>@cluster0.pthh3.mongodb.net/test")

#Obteniendo el numero de registros
match$count()

match$find('{"HomeTeam":"Real Madrid","Date":"2015-12-20"}')

match = mongo(collection = "mtcars", db = "match_games") 
match$insert(mtcars)

#Conexion Cerrada
match$disconnect()
