#Ejercicios para clase 4
#Realizados en conjunto. Alumnas: Florencia Kihara y Victoria Marco

#Probando diferentes formas de importar datos

delitos_2020 <-read.csv(file ="delitos_badata_2020.csv")

library(readr)
delitos_2020B <- read_csv(file = "delitos_badata_2020.csv")

library(vroom)
delitos_2020C <- vroom("delitos_badata_2020.csv", delim = ",")

#Conociendo el dataset
as_tibble(delitos_2020B)

head(delitos_2020B)

str(delitos_2020B)

#Ordenando la info

library(tidyverse)
library(tidyr)

delitos_2020B$uso_armas
str(delitos_2020B$uso_armas)
class(delitos_2020B$uso_armas)  
summary(delitos_2020B$uso_armas)

#Como la columna "uso de armas" no tiene información, la eliminaremos. 
delitos_2020B <- select(delitos_2020B, -"uso_armas")

#Para separar la fecha, es decir, poder conocer el número del día, el mes y el año:
delitos_2020B <- delitos_2020B %>% 
  separate(fecha, into=c("fecha_día", "fecha_mes", "fecha_año"), sep= "/")

#Para poder tener en una misma columna la info de la comuna y el barrio donde ocurrió el delito, generaré una nueva columna
delitos_2020B <- delitos_2020B %>% 
  mutate(comuna_barrio=paste(comuna, barrio, sep = "_"))

#Para ordenar los registros por franja de horario en el que ocurrieron:
delitos_2020B <- delitos_2020B %>% 
  arrange(franja)

#Para agrupar los datos y obtener medidas de resumen
delitos_2020_cant <- delitos_2020B %>% 
  group_by(tipo, subtipo) %>% 
  summarise(cantidad=n())
#La mayor cantidad de delitos son robos con violencia (30.068 obs)

delitos_2020_cantbarr <- delitos_2020B %>% 
  group_by(barrio, tipo="Robo (con violencia)") %>% 
  summarise(cantidad=n())
#A su vez, la mayor cantidad de robos con violencia ocurrieron en el barrio de Balvanera (4.502)

            

