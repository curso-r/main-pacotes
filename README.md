
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Pacotes

Repositório principal do curso Pacotes.

Para informações sobre o curso e inscrição, acesse:
<https://curso-r.com/cursos>

**Acesse o material completo do curso escolhendo uma das turmas
abaixo**.

| Turma          | Material                                   | Github                                      |
|:---------------|:-------------------------------------------|:--------------------------------------------|
| agosto de 2021 | <https://curso-r.github.io/202108-pacotes> | <https://github.com/curso-r/202108-pacotes> |
| abril de 2021  | <https://curso-r.github.io/202104-pacotes> | <https://github.com/curso-r/202104-pacotes> |

**Atenção**: o material de cursos que ainda não começaram pode não
existir ainda.

## Ementa do curso

-   **Fundamentos de desenvolvimento de pacotes em R**

    -   Git e GitHub

    -   O arquivo DESCRIPTION

    -   Estrutura de pastas e arquivos

    -   O pacote {usethis}

    -   Melhores práticas de desenvolvimento de pacotes

-   **Documentação**

    -   Criando bons nomes

    -   Documentação de funções

    -   Documentação de bases de dados

    -   Acentos, encoding e variáveis globais

-   **Testes unitários e consistência de código**

    -   O pacote {testthat}

    -   Tipos de testes

    -   Passando no devtools::check()

-   **Disponibilizando seu pacote**

    -   Disponibilizando em um repositório

    -   Criando um {pkgdown}

    -   Integração contínua com Github Actions

    -   Regras para colocar um pacote no CRAN

## Pré-requisitos

-   Instalar o R e o RStudio:

    -   [Guia de instalação do
        R](https://livro.curso-r.com/1-1-instalacao-do-r.html)

    -   [Guia de instalação do
        RStudio](https://livro.curso-r.com/1-2-instalacao-do-rstudio.html)

-   Instalar o [Git](https://git-scm.com/)

    -   Guia de instalação - Em breve

-   Criar uma conta no [GitHub](https://github.com/)

## Pacotes necessários

``` r
pacotes <- c(
  "devtools",
  "usethis",
  "pkgdown",
  "testthat",
  "roxygen2", 
  "knitr"
) 

install.packages(pacotes)
```
