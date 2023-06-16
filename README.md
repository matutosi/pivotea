
<!-- README.md is generated from README.Rmd. Please edit that file -->

# pivotea

<!-- badges: start -->
<!-- badges: end -->

The goal of pivotea is to make pivot table easily by specifying rows,
columns, values and split.

## Installation

You can install the development version of pivotea from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
remotes::install_github("matutosi/pivotea")
```

You can also install from CRAN:

``` r
install.packages("pivotea")
```

## Example

You can use pivot to make a pivot table easily.

``` r
library(pivotea)
library(dplyr)
library(ggplot2)
library(pivotea)
hogwarts %>%
  pivot(row = "hour", col = "wday", value = c("subject", "teacher", "room"), split = c("house", "grade"))
starwars %>%
  pivot(row = "homeworld", col = "species", value = "name", split = "sex")
msleep %>%
  pivot(row = "vore", col = "conservation", value = "name") %>%
  na2empty() %>%
  print(n = nrow(.))
as_tibble(Titanic) %>%
  pivot(row = "Age", col = c("Sex", "Survived"), value = "n", split = "Class")
diamonds %>%
  pivot(row = "cut", col = "color", value = "price", split = "clarity")
```

## Citation

Toshikazu Matsumura (2023) Create Pivot Table Easily.
<https://github.com/matutosi/pivotea/>.
