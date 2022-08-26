# Marmitas veganas ------------------------------------------------

# Transforme o código abaixo em uma função!

# Objetivo: função que retorna uma base de dados (tibble) contendo informações
# sobre marmitas veganas. Chame a função de: 'buscar_marmitas()'

# Dica:
# Para saber de qual pacote uma função pertence, busque essa função no help
# (pode ser no painel Help do RStudio, ou usando a função help() )
# No início do help, aparecerá o nome da função e o nome do pacote entre chaves.
# Ex: group_by {dplyr} - significa que a função group_by() faz parte do 
# pacote {dplyr}

# Código original ----------------------------------------------
library(tidyverse)
library(xml2)

nm <- c("nome", "desc", "valor")
"https://www.beleaf.com.br/cardapio-marmitas-veganas" |>
  read_html() |>
  xml_find_all("//div[contains(@class, 'product-item-details')]") |>
  map(~ str_squish(xml_text(xml_children(.x)))) |>
  map_dfr(~ enframe(set_names(.x, nm)), .id = "item") |>
  pivot_wider() |>
  select(item, nome, desc, valor)

# Escreva abaixo sua função -------------------------------------------




# Verificação -------------------------------------------------------------

# Use a função para ver se ela funciona!

buscar_marmitas()


# Esperamos que retorne, no console, a tibble contendo 
# informações sobre as marmitas veganas:
# 
# # A tibble: 37 × 4
# item  nome                                   desc                   valor
# <chr> <chr>                                  <chr>                  <chr>
# 1 1     Sugestão do Chef                       5 refeições 100% vege… R$14…
# 2 2     Kibe Proteico de Berinjela             Batata bolinha assada… R$31…
# 3 3     Maklub com Falafel e Pasta de Tofu     Arroz, pimentão, cebo… R$29…
# 4 4     Falafel ao Molho de Hortelã            Homus de beterraba, a… R$29…
# 5 5     Strogonoff de Dois Cogumelos           Arroz branco e brócol… R$28…
# 6 6     Baião de Dois                          Mandioca cozida e cou… R$25…
# 7 7     Bobó de Banana da Terra                Arroz jasmim e espina… R$28…
# 8 8     Moqueca de Coração de Pupunha          Arroz Branco e farofa… R$26…
# 9 9     Arroz com Funghi ao Creme de Castanhas Pupunha, cenoura e ab… R$27…
# 10 10    Tagliatelle ao Funghi                  Tomatinhos confit com… R$30…
# # … with 27 more rows
