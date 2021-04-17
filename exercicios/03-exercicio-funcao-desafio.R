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
