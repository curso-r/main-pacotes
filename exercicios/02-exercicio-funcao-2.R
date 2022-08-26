# Melhor time da temporada ------------------------------------------------

# Transforme o código abaixo em uma função!

# Objetivo: função que retorna qual é o time com mais vitórias na temporada. A
# função deve ser chamada 'melhor_time_temporada()' e ter o argumento 'ano'.

# Código original ----------------------------------------------
library(tidyverse)

ano <- 2018

"https://git.io/JOqUN" |>
  read_csv2() |>
  group_by(temporada) |>
  filter(quem_ganhou != "Empate", temporada %in% ano) |>
  count(quem_ganhou, sort = TRUE, name = "n_vitorias") |>
  filter(n_vitorias == max(n_vitorias)) |>
  arrange(temporada)

# Escreva abaixo sua função -------------------------------------------





# Verificação -------------------------------------------------------------

# Use a função para ver se ela funciona!

# Qual é o time que ganhou mais jogos na temporada de 2020? O resultado
# esperado é o time Flamengo!

melhor_time_temporada(ano = 2020)

# Experimente a função criada usando os anos de 2019 e 2020. O resultado
# esperado é o time Flamengo (para os dois anos)!

melhor_time_temporada(ano = c(2019, 2020))

# Desafio! Adapte a função para que o valor padrão para o argumento 'anos'
# sejam todos os anos da base, e o código abaixo funcione!

melhor_time_temporada()
