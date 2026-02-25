# Replace a col with a data.frame.

Replace a col with a data.frame.

## Usage

``` r
replace_col(df, replace)
```

## Arguments

- df, replace:

  A dataframe.

## Value

A dataframe.

## Examples

``` r
(state <- tibble::tibble(state = state.name, area = state.area))
#> # A tibble: 50 × 2
#>    state         area
#>    <chr>        <dbl>
#>  1 Alabama      51609
#>  2 Alaska      589757
#>  3 Arizona     113909
#>  4 Arkansas     53104
#>  5 California  158693
#>  6 Colorado    104247
#>  7 Connecticut   5009
#>  8 Delaware      2057
#>  9 Florida      58560
#> 10 Georgia      58876
#> # ℹ 40 more rows
(abb <- tibble::tibble(state = state.name, abb = state.abb))
#> # A tibble: 50 × 2
#>    state       abb  
#>    <chr>       <chr>
#>  1 Alabama     AL   
#>  2 Alaska      AK   
#>  3 Arizona     AZ   
#>  4 Arkansas    AR   
#>  5 California  CA   
#>  6 Colorado    CO   
#>  7 Connecticut CT   
#>  8 Delaware    DE   
#>  9 Florida     FL   
#> 10 Georgia     GA   
#> # ℹ 40 more rows
replace_col(state, abb)
#> Joining with `by = join_by(state)`
#> # A tibble: 50 × 2
#>    state   area
#>    <chr>  <dbl>
#>  1 AL     51609
#>  2 AK    589757
#>  3 AZ    113909
#>  4 AR     53104
#>  5 CA    158693
#>  6 CO    104247
#>  7 CT      5009
#>  8 DE      2057
#>  9 FL     58560
#> 10 GA     58876
#> # ℹ 40 more rows
```
