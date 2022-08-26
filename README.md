
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Pacotes

Repositório principal do curso Pacotes.

Para informações sobre o curso e inscrição, acesse:
<https://curso-r.com/cursos>

**Acesse o material completo do curso escolhendo uma das turmas
abaixo**.

| Turma            | Material                                   | Github                                      |
|:-----------------|:-------------------------------------------|:--------------------------------------------|
| novembro de 2022 | <https://curso-r.github.io/202211-pacotes> | <https://github.com/curso-r/202211-pacotes> |
| agosto de 2022   | <https://curso-r.github.io/202208-pacotes> | <https://github.com/curso-r/202208-pacotes> |
| maio de 2022     | <https://curso-r.github.io/202205-pacotes> | <https://github.com/curso-r/202205-pacotes> |

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

-   Instalar o R e o RStudio (e **atualizar**):

    -   [Guia de instalação do
        R](https://livro.curso-r.com/1-1-instalacao-do-r.html)

    -   [Guia de instalação do
        RStudio](https://livro.curso-r.com/1-2-instalacao-do-rstudio.html)

-   Instalar o [Git](https://git-scm.com/) (saiba mais
    [aqui](https://livro.curso-r.com/1-3-instalacao-adicionais.html#git))

-   Criar uma conta no [GitHub](https://github.com/)

-   Instalar as [Ferramentas de
    desenvolvimento](https://r-pkgs.org/setup.html#setup-tools):

    -   Windows: [RTools
        instalado](https://livro.curso-r.com/1-3-instalacao-adicionais.html#rtools)

    -   Linux:
        [r-base-dev](https://livro.curso-r.com/1-3-instalacao-adicionais.html#rtools)

    -   MacOS: Xcode command line tools

Para verificar se as ferramentas de desenvolvimento estão instaladas,
utilize a função:

``` r
devtools::has_devel()
#> Your system is ready to build packages!
```

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
