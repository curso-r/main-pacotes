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
"https://www.beleaf.com.br/cardapio-marmitas-veganas" %>%
  read_html() %>%
  xml_find_all("//div[contains(@class, 'product-item-details')]") %>%
  map(~ str_squish(xml_text(xml_children(.x)))) %>%
  map_dfr(~ enframe(set_names(.x, nm)), .id = "item") %>%
  pivot_wider() %>%
  select(item, nome, desc, valor)

# Escreva abaixo sua função -------------------------------------------




# Verificação -------------------------------------------------------------

# Use a função para ver se ela funciona!

buscar_marmitas()


# Esperamos que retorne, no console, a tibble contendo 
# informações sobre as marmitas veganas:


# A tibble: 38 × 4
# item  nome                                  desc           valor  
# <chr> <chr>                                 <chr>          <chr>  
# 1 1     KIBE PROTEICO DE BERINJELA            Batata bolinh… R$29,9…
# 2 2     MAKLUB COM FALAFEL E CREME DE TOFU    Arroz, piment… R$27,9…
# 3 3     MOUSSAKA COM PURÊ DE BATATAS          Berinjela e m… R$27,9…
# 4 4     TAGLIATELLE AO FUNGHI                 Tomatinhos co… R$28,9…
# 5 5     MACARONI COM CHEDDAR DE CASTANHAS     Farofa de sem… R$28,9…
# 6 6     RAVIOLI DE ESPINAFRE AO SUGO          Com castanhas… R$28,9…
# 7 7     YAKISOBA                              Shiitake, bró… R$24,9…
# 8 8     ARROZ BIRYANI DE JACA                 Couve-flor, e… R$24,9…
# 9 9     VEGETAIS ASIÁTICOS AO MOLHO DE COCO   Grão de bico,… R$21,9…
# 10 10    MOQUECA DE PUPUNHA E CASTANHA DE CAJU Arroz e farof… R$24,9…
# # … with 28 more rows
