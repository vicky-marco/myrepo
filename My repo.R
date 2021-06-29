#Ejercicios para clase 4

#Probando diferentes formas de importar datos

of_gastro <-read.csv(file ="oferta_gastronomica.csv")

library(readr)
of_gastro2 <- read_csv(file = "oferta_gastronomica.csv")

library(readxl)
of_gastro3 <- read_xlsx(path = "oferta_gastronomica.xlsx")

library(vroom)
of_gastro4 <- vroom("oferta_gastronomica.csv", delim = ",")

head(of_gastro2)

str(of_gastro2)

library(tidyverse)

tidyr::pivot_wider(of_gastro2)
tidyr::pivot_longer(of_gastro2)
