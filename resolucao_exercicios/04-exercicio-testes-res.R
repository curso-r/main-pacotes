library(testthat)

test_that("media_segura retorna erros apropriados", {

  # x
  expect_error(media_segura("1"))

  # trim
  expect_error(media_segura(1:10, trim = c(0, 0)))
  expect_error(media_segura(1:10, trim = "0"))
  expect_error(media_segura(1:10, trim = -1))
  expect_error(media_segura(1:10, trim = 1))

  # na.rm
  expect_error(media_segura(1:10, na.rm = c(TRUE, TRUE)))
  expect_error(media_segura(1:10, na.rm = 1))
})
