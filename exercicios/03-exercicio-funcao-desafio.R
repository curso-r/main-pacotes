# Marmitas veganas ------------------------------------------------

# Transforme o código abaixo em uma função!

# Objetivo: função que retorna uma base de dados (tibble) contendo informações
# sobre marmitas veganas. Chame a função de: 'buscar_marmitas_veganas()'

# Dica:
# Para saber de qual pacote uma função pertence, busque essa função no help
# (pode ser no painel Help do RStudio, ou usando a função help() )
# No início do help, aparecerá o nome da função e o nome do pacote entre chaves.
# Ex: group_by {dplyr} - significa que a função group_by() faz parte do 
# pacote {dplyr}

# Código original ----------------------------------------------
library(tidyverse)
library(xml2)

nm <- c("nome", "desc", "peso", "valor", "add")
"https://www.beleaf.com.br/cardapio-marmitas-veganas" %>%
  read_html() %>%
  xml_find_all("//div[contains(@class, 'product-item-details')]") %>%
  map(~ str_squish(xml_text(xml_children(.x)))) %>%
  map_dfr(~ enframe(set_names(.x, nm)), .id = "item") %>%
  pivot_wider() %>%
  select(item, nome, desc, peso, valor)

# Escreva abaixo sua função -------------------------------------------




# Verificação -------------------------------------------------------------

# Use a função para ver se ela funciona!

buscar_marmitas_veganas()


# Esperamos que retorne, no console, a tibble contendo 
# informações sobre as marmitas veganas:

# # A tibble: 34 x 5
# item  nome            desc                   peso             valor    
# <chr> <chr>           <chr>                  <chr>            <chr>    
# 1 1     COUVE-FLOR E G… Cevadinha com cenoura… 360g Apimentado… R$22,90 …
# 2 2     EMPANADINHOS S… Creme de milho, arroz… 360g Proteico P… R$27,30 …
# 3 3     SEM-FRANGO À P… Arroz integral e bata… 360g Apimentado… R$27,30 …
# 4 4     FALAFEL AO MOL… Homus de beterraba, a… 360g Proteico M… R$27,30 …
# 5 5     BOWL DE GRÃO D… Couve-flor na páprica… 360g Proteico M… R$20,90 …
# 6 6     TOFU TIKKA MAS… Arroz jasmim e ervilh… 360g Apimentado… R$25,70 …
# 7 7     SHIMEJI DE PAN… Quinoa e purê de mand… 360g Pouca calo… R$23,90 …
# 8 8     PAELLA DE FRUT… Brócolis, tomates con… 360g Pouca calo… R$20,90 …
# 9 9     SEM-CARNE MOÍD… Feijão carioca, arroz… 360g Proteico M… R$20,90 …
# 10 10   RAGU DEFUMADO … Polenta cremosa e cen… 360g Apimentado… R$23,90 …
# # … with 24 more rows
