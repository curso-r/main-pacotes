# Entradas incorretas -----------------------------------------------------

# Crie testes para o código abaixo!

# Objetivo: garantir que, quando o usuário entra informações incorretas na
# função, ela retorna erros na forma esperada.

# Função original ---------------------------------------------------------
media_segura <- function(x, ..., trim = 0, na.rm = FALSE) {

  # x precisa ser numerical, logical ou complex
  if (!is.numeric(x) && !is.logical(x) && !is.complex(x)) {
    stop("Argumento `x` deve ser um vetor numérico, booleano ou complexo")
  }

  # trim precisa estar no intervalo [0, 0.5] e ter comprimento 1
  if (length(trim) != 1 || !is.numeric(trim) || trim < 0 || trim > 0.5) {
    stop("Argumento `trim` deve ser um escalar numérico no intervalo [0, 0.5]")
  }

  # na.rm precisa ser logical de comprimento 1
  if (length(na.rm) != 1 || !is.logical(na.rm)) {
    stop("Argumento `na.rm` deve ser um escalar booleano")
  }

  return(mean(x = x, ..., trim = trim, na.rm = na.rm))
}

# Escreva abaixo seus testes ----------------------------------------------
library(testthat)

test_that("media_segura retorna erros apropriados", {

})




# Verificação -------------------------------------------------------------

# Se modificarmos a função media_segura(), seus testes precisam falhar
media_segura <- function(x, ..., trim = 0, na.rm = FALSE) {

  # Ignorar as verificações e apenas retornar o resultado
  return(mean(x = x, ..., trim = trim, na.rm = na.rm))
}

# Copie e cole aqui os seus testes, executando eles de novo
### TESTES ###

# Você deve receber alertas similares ao apresentado abaixo
#> ── Failure (Line 2): media_segura retorna erros apropriados ───────────────
#> `media_segura("1")` did not throw an error.
