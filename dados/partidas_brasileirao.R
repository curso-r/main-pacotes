# Prepara a base para os exercicios de funcoes
# remotes::install_github("williamorim/brasileirao")

brasileirao::matches %>%
  dplyr::mutate(
    home = brasileirao::fix_names(home),
    away = brasileirao::fix_names(away)
  ) %>%
  dplyr::rename(
    "temporada" = season,
    "data" = date,
    "gols" = score,
    "time_casa" = home,
    "time_visitante" = away
  ) %>%
  tidyr::separate(
    gols,
    into = c("gols_casa", "gols_visitante"),
    sep = "x",
    remove = FALSE
  ) %>%
  dplyr::relocate(gols_casa, gols_visitante, .after = time_visitante) %>%
  dplyr::mutate(
    quem_ganhou = dplyr::case_when(
      gols_casa > gols_visitante ~ time_casa,
      gols_visitante > gols_casa ~ time_visitante,
      gols_visitante == gols_casa ~ "Empate"
    )
  ) %>%
  readr::write_csv2("dados/partidas_brasileirao.csv")
