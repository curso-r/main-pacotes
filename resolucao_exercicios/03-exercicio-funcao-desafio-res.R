
#' Buscar marmitas veganas do cardapio da Beleaf
#'
#' Faz a raspagem dos dados do site da marca Beleaf,
#' e busca uma tabela contendo informacoes sobre o 
#' cardapio das marmitas veganas.
#'
#' @return Uma tibble com 5 colunas e 30 linhas 
#' @export
#'
#' @examples
#' buscar_marmitas_veganas()
buscar_marmitas_veganas <- function() {
  nm <- c("nome", "desc", "valor")
  "https://www.beleaf.com.br/cardapio-marmitas-veganas" |>
    xml2::read_html() |>
    xml2::xml_find_all("//div[contains(@class, 'product-item-details')]") |>
    purrr::map(~ stringr::str_squish(xml2::xml_text(xml2::xml_children(.x)))) |>
    purrr::map_dfr(~ tibble::enframe(purrr::set_names(.x, nm)), .id = "item") |>
    tidyr::pivot_wider() |>
    dplyr::select(item, nome, desc, valor)
}
