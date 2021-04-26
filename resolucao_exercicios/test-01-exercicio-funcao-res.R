test_that("encontrar_pior_ano_time() works", {

  # Tibble
  expect_s3_class(encontrar_pior_ano_time(), "tbl")
  expect_equal(ncol(encontrar_pior_ano_time()), 3)
  expect_equal(nrow(encontrar_pior_ano_time()), 1)

  # Valores
  expect_equal(encontrar_pior_ano_time()$temporada, 2008)
  expect_equal(encontrar_pior_ano_time("São Paulo")$temporada, 2017)

  # Erros
  expect_warning(encontrar_pior_ano_time("sãopaulo"), "no non-missing arg")
  expect_warning(encontrar_pior_ano_time(1), "no non-missing arg")
})
