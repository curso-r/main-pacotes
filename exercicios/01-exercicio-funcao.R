
# Ano em que o time teve menos vitórias -----------------------------------

# Transforme o código abaixo em uma função!

# Objetivo: função que retorna qual é a temporada em que o time teve menos
# vitórias. A função deve ser chamada 'encontrar_pior_ano_time()' e ter o
# argumento 'time'.

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

# Verificação -------------------------------------------------------------

# Use a função para ver se ela funciona!

# Qual é a temporada em que o Flamengo ganhou menos partidas? O resultado
# esperado é 2010!

encontrar_pior_ano_time(time = "Flamengo")
