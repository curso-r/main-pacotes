# Melhor time da temporada------------------------------------------------------
# Transforme o código abaixo em uma função.
# Objetivo: função que retorna qual é o time com mais vitórias na temporada.
# A função deve ser chamada melhor_time_temporada()
# e ter o argumento ano.

library(tidyverse)

ano <- 2018

"https://git.io/JOqUN" %>% 
read_csv2() %>%
  group_by(temporada) %>%
  filter(quem_ganhou != "Empate", temporada %in% ano) %>%
  count(quem_ganhou, sort = TRUE, name = "n_vitorias") %>%
  filter(n_vitorias == max(n_vitorias)) %>%
  arrange(temporada)


# Experimente se a função está funcionando:

# Use a função para ver se ela funciona!
# Qual é o time que ganhou mais jogos na temporada de 2020?
# O resultado esperado é o time Flamengo!

melhor_time_temporada(ano = 2020)


# Experimente a função criada usando os anos de 2019 e 2020.
# O resultado esperado é o time Flamengo (para os dois anos)!

melhor_time_temporada(ano = c(2019, 2020))

# Desafio! Adapte a função para que o valor padrão
# para o argumento `anos` sejam todos os anos da base,
# e o código abaixo funcione!

melhor_time_temporada()

# Ano em que o time teve menos vitórias ----------------------------------------
# Transforme o código abaixo em uma função.
# Objetivo: função que retorna qual é a temporada em que o time teve menos vitórias
# A função deve ser chamada encontrar_pior_ano_time()
# e ter o argumento time.

library(tidyverse)
time <- "Cruzeiro"

"https://git.io/JOqUN" %>% 
  read_csv2() %>%
  group_by(temporada, quem_ganhou) %>%
  filter(quem_ganhou != "Empate", quem_ganhou %in% time) %>%
  count(quem_ganhou, sort = TRUE, name = "n_vitorias") %>%
  ungroup() %>%
  filter(n_vitorias == min(n_vitorias)) %>% 
  rename("time" = quem_ganhou)


# Experimente se a função está funcionando:

# Use a função para ver se ela funciona!
# Qual é a temporada em que o Flamengo ganhou menos partidas? 
# O resultado esperado é 2010


encontrar_pior_ano_time(time = "Flamengo")
