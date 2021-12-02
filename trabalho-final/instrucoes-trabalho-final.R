###############################################################################
### Este arquivo serve de template para o projeto final do curso 'Pacotes'  ###
### ministrado pela Curso-R. Aqui constam as 5 funções simples que devem    ###
### aparecer no seu pacote devidamente comentadas, documentadas e testadas. ###
###############################################################################

# stringr::str_c()
minha_str_c <- function(..., sep = "", collapse = NULL) {
  paste(..., sep = sep, collapse = collapse)
}

# purrr::map()
minha_map <- function(.x, .f, ...) {
  lapply(X = .x, FUN = rlang::as_function(.f), ...)
}

# readr::write_rds()
minha_write_rds <- function(x, file, compress = c("none", "gz", "bz2", "xz"),
                            version = 2, refhook = NULL, ...) {
  
  compress <- match.arg(compress)
  compress <- switch(
    compress,
    "none" = FALSE,
    "gz" = "gzip",
    "bz2" = "bzip2",
    "xz" = "xz",
  )
  
  saveRDS(
    object = x, file = file, version = version,
    compress = compress, refhook = refhook, ...
  )
}

# dplyr::sample_n()
minha_sample_n <- function(tbl, size, replace = FALSE, weight = NULL) {
  rows <- sample(1:nrow(tbl), size = size, replace = replace, prob = weight)
  tbl[rows, ]
}

# tidyr::full_seq()
minha_full_seq <- function(f, only) {
  
  rng <- range(x, na.rm = TRUE)
  if (period - ((rng[2] - rng[1]) %% period) <= tol) {
    rng[2] <- rng[2] + tol
  }
  
  seq(rng[1], rng[2], by = period)
}



# OPÇÃO 2 --- Marmitas! ------------------------------
# O script abaixo contém duas funções, já prontas. 
# Uma das funções é para buscar a base de marmitas veganas,
# e a outra é para sortear uma marmita para comprar!
# Você deve criar um pacote e:
# Disponibilize a base obtida na primeira função dentro do pacote.
# Não esqueça de deixar todos os pacotes de dependência listados
# no arquivo DESCRIPTION.
# Crie testes para as duas funções.
# Documente as duas funções.
# Tente fazer o CHECK passar.
# Desafio: deixe o seu pacote em um repositório no GitHub.

##  Função 1:  obter a base de Marmitas --------------------
buscar_marmitas_veganas <- function() {
  html <- "https://www.beleaf.com.br/cardapio-marmitas-veganas" %>%
    xml2::read_html()
  
  url <- html %>%
    xml2::xml_find_all("//a[contains(@class, 'product-item-link')]") %>% 
    purrr::map(~ xml2::xml_attr(.x, "href")) %>%
    purrr::map_dfr(~ tibble::enframe(purrr::set_names(.x, "url")), .id = "item") %>%
    dplyr::select("url" = value) %>%
    tidyr::drop_na()
    
  
  nm <- c("nome", "descricao", "preco")
  infos <-
    html %>% xml2::xml_find_all("//div[contains(@class, 'product-item-details')]") %>%
    purrr::map(~ stringr::str_squish(xml2::xml_text(xml2::xml_children(.x)))) %>%
    purrr::map_dfr(~ tibble::enframe(purrr::set_names(.x, nm)), .id = "item") %>%
    tidyr::pivot_wider() %>%
    dplyr::mutate(
      preco = readr::parse_number(preco, locale = readr::locale(decimal_mark = ",")),
      tipo_refeicao = dplyr::case_when(
        stringr::str_detect(nome, "BOLO|MOUSSE|BROWNIE|CHEESECAKE|TORTA") ~ "Doce",
        stringr::str_detect(nome, "CREME DE|MINESTRONE") ~ "Sopa",
        TRUE ~ "Prato"
      )
    ) 
  
  
  dplyr::bind_cols(infos, url)
}

# Exemplo de uso:
buscar_marmitas_veganas()


## Disponibilize a base de marmitas no seu pacote! -----
marmitas_veganas <- buscar_marmitas_veganas()



## Função 2 -----------
# Função para sortear uma marmita, usando a base de marmitas
# que está no seu pacote
sortear_marmita <-
  function(tipo = c("Sopa", "Prato", "Doce"), preco_maximo = 50) {
    marmitas_veganas %>%
      dplyr::filter(preco <= preco_maximo, tipo_refeicao %in% tipo) %>%
      dplyr::slice_sample() %>%
      dplyr::mutate(
        texto = glue::glue(
          "Refeição  sugerida: {nome} \n
      Ingredientes: {descricao} \n
      Preço: R$ {preco} \n
      Acesse o site: {url}"
        )
      ) %>%
      dplyr::pull(texto)
  }

# Exemplos de uso:
sortear_marmita()

# só quero gastar até 15 reais:
sortear_marmita(preco_maximo = 22)

# só uma sopinha:
sortear_marmita(tipo = "Sopa")

# prato principal:
sortear_marmita(tipo = "Prato")

# sobremesa:
sortear_marmita(tipo = "Doce")


# SORTEAR COMBO --------------------
# A Beleaf vende combos de 12, 21 ou 30 marmitas, 
# e muitas vezes é difícil escolher quais marmitas colocar no combo!
# Essa função decide para nós :)

sortear_combo_marmitas <- function(n_marmitas = 12){
  marmitas_veganas %>%
    dplyr::sample_n(n_marmitas, replace = TRUE)
}

# Sortear um combo de 12 marmitas
sortear_combo_marmitas(12)
# Sortear um combo de 21 marmitas
sortear_combo_marmitas(21)
# Sortear um combo de 30 marmitas
sortear_combo_marmitas(30) 

