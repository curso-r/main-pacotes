# Objetivo
# Escreva alguns testes para a função encontrar_pior_ano_time()

# Função original ---------------------------------------------------------

encontrar_pior_ano_time <- function(time = "Santos") {
  meupacote::partidas_brasileirao |>
    dplyr::group_by(temporada, quem_ganhou) |>
    dplyr::filter(quem_ganhou != "Empate", quem_ganhou %in% time) |>
    dplyr::count(quem_ganhou, sort = TRUE, name = "n_vitorias") |>
    dplyr::ungroup() |>
    dplyr::filter(n_vitorias == min(n_vitorias)) |>
    dplyr::rename("time" = quem_ganhou)
}

# Escreva abaixo seus testes ----------------------------------------------
library(testthat)

test_that("encontrar_pior_ano_time() funciona", {
  
})
