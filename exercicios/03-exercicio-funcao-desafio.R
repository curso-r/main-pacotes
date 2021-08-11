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

# A tibble: 32 × 4
# item  nome                                  desc        valor   
# <chr> <chr>                                 <chr>       <chr>   
# 1 1     ARROZ BIRYANI DE JACA                 Couve-flor… R$24,90…
# 2 2     MAC NOT CHEESE                        Brócolis a… R$23,90…
# 3 3     MOQUECA DE PUPUNHA E CASTANHA DE CAJU Arroz e fa… R$24,90…
# 4 4     TUTU DE FEIJÃO E TOFU DEFUMADO        Arroz inte… R$20,90…
# 5 5     LEGUMES E COGUMELOS DE PANELA         Quinoa e p… R$23,90…
# 6 6     BOBÓ DE BANANA DA TERRA               Arroz jasm… R$26,90…
# 7 7     ALMÔNDEGAS DO FUTURO™                 Espaguete … R$27,90…
# 8 8     LASANHA DA CASA                       Molho bolo… R$28,90…
# 9 9     EMPANADINHOS SEM-FRANGO               Creme de m… R$27,30…
# 10 10    COUVE-FLOR E GRÃO DE BICO AO CURRY    Cevadinha … R$22,90…
# # … with 22 more rows
