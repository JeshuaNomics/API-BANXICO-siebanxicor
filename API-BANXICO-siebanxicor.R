# API-BANXICO-siebanxicor
# library(devtools)
install.packages("siebanxicor")
library("siebanxicor")
library("ggplot2")

# Se debe especificar el token de consulta.
setToken("[Token]")

# Realiza la consulta de las series
# (del 01/01/2016 al 12/07/2018).
idSeries <- c("SF43718","SF46410","SF46407")
series <- getSeriesData(idSeries, '2016-01-01','2018-07-12')

# Generar la gráfica.
ggplot(NULL, aes(x=date, y=value)) +
  geom_line(color="#ff1a1a", data = getSerieDataFrame(series, "SF43718")) +
  geom_line(color="#0000b3", data = getSerieDataFrame(series, "SF46410")) +
  geom_line(color="#00b300", data = getSerieDataFrame(series, "SF46407")) +
  theme_light()

# Generar la gráfica de tipos de cambios de manera automática.
Grafica_tipos_de_cambio <- function() {
  setToken("[Token]")
  idSeries <- c("SF43718","SF46410","SF46407")
  series <- getSeriesData(idSeries, '2016-01-01','2018-07-12')
  ggplot(NULL, aes(x=date, y=value)) +
    geom_line(color="#ff1a1a", data = getSerieDataFrame(series, "SF43718")) +
    geom_line(color="#0000b3", data = getSerieDataFrame(series, "SF46410")) +
    geom_line(color="#00b300", data = getSerieDataFrame(series, "SF46407")) +
    theme_light()
}
Grafica_tipos_de_cambio()
