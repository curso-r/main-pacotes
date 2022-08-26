
#' Encontrar o melhor time da temporada do Brasileirao
#' 
#' Usando a base do Brasileirao, o(s) melhor(res) time(s) da temporada
#' do Brasileirao na serie historica.
#'
#' @param ano Numero com 4 digitos referente ao  ano da temporada
#' (2003 ate 2021 por padrao)
#'
#' @return Uma tibble com tres colunas
#' @export
#'
#' @examples
#' melhor_time_temporada(2018)
melhor_time_temporada <- function(ano = 2003:2021) {
  "https://git.io/JOqUN" |>
    readr::read_csv2() |>
    dplyr::group_by(temporada) |>
    dplyr::filter(quem_ganhou != "Empate", temporada %in% ano) |>
    dplyr::count(quem_ganhou, sort = TRUE, name = "n_vitorias") |>
    dplyr::filter(n_vitorias == max(n_vitorias)) |>
    dplyr::arrange(temporada)
}
