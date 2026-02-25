# Detect if df has col

Detect if df has col

## Usage

``` r
has_col(df, col)
```

## Arguments

- df:

  A dataframe.

- col:

  A string or string vector.

## Value

A dataframe.

## Examples

``` r
colnames(mtcars)
#>  [1] "mpg"  "cyl"  "disp" "hp"   "drat" "wt"   "qsec" "vs"   "am"   "gear"
#> [11] "carb"
has_col(mtcars, c("mpg", "cyl"))
#> [1] TRUE
has_col(mtcars, c("mpg", "foo"))
#> Warning: not found col foo in df
#> [1] FALSE
```
