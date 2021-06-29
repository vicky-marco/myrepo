#Ejercicios para clase 4

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

delitos_2020B %>% 
  pivot_wider(names_from = "comuna",
              values_from = "victimas")

  
  
  
  
  
