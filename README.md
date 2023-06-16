
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
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
library(ggplot2)
library(pivotea)
hogwarts %>%
  pivot(row = "hour", col = "wday", value = c("subject", "teacher", "room"), split = c("house", "grade"))
#> $Automatic.1
#> # A tibble: 0 × 8
#> # ℹ 8 variables: house <chr>, grade <chr>, hour <int>, mon <chr>, tue <chr>,
#> #   wed <chr>, thu <chr>, fri <chr>
#> 
#> $G.1
#> # A tibble: 4 × 8
#>   house grade  hour mon                  tue                   wed   thu   fri  
#>   <chr> <chr> <int> <chr>                <chr>                 <chr> <chr> <chr>
#> 1 G     1         1 DADA_DADA Teacher_NA Transfiguration_McGo… <NA>  <NA>  <NA> 
#> 2 G     1         2 Herbology_Sprout_NA  History of Magic_Bin… Herb… Flyi… <NA> 
#> 3 G     1         6 <NA>                 <NA>                  Poti… Tran… Char…
#> 4 G     1         7 <NA>                 Charms_Flitwick_NA    Poti… Hist… <NA> 
#> 
#> $H.1
#> # A tibble: 4 × 8
#>   house grade  hour mon                 tue                    wed   thu   fri  
#>   <chr> <chr> <int> <chr>               <chr>                  <chr> <chr> <chr>
#> 1 H     1         1 Potions_Snape_NA    Transfiguration_McGon… <NA>  <NA>  <NA> 
#> 2 H     1         2 Herbology_Sprout_NA Charms_Flitwick_NA     Herb… <NA>  Flyi…
#> 3 H     1         6 <NA>                <NA>                   DADA… Tran… Hist…
#> 4 H     1         7 Potions_Snape_NA    History of Magic_Binn… <NA>  Char… <NA> 
#> 
#> $R.1
#> # A tibble: 4 × 8
#>   house grade  hour mon              tue                       wed   thu   fri  
#>   <chr> <chr> <int> <chr>            <chr>                     <chr> <chr> <chr>
#> 1 R     1         1 Potions_Snape_NA Herbology_Sprout_NA       <NA>  Herb… Tran…
#> 2 R     1         2 <NA>             History of Magic_Binns_NA Tran… <NA>  Flyi…
#> 3 R     1         6 <NA>             <NA>                      DADA… <NA>  Char…
#> 4 R     1         7 Potions_Snape_NA Charms_Flitwick_NA        <NA>  Hist… <NA> 
#> 
#> $S.1
#> # A tibble: 4 × 8
#>   house grade  hour mon                  tue                   wed   thu   fri  
#>   <chr> <chr> <int> <chr>                <chr>                 <chr> <chr> <chr>
#> 1 S     1         1 DADA_DADA Teacher_NA Herbology_Sprout_NA   <NA>  Herb… Tran…
#> 2 S     1         2 <NA>                 Charms_Flitwick_NA    Tran… Flyi… <NA> 
#> 3 S     1         6 <NA>                 <NA>                  Poti… <NA>  Hist…
#> 4 S     1         7 <NA>                 History of Magic_Bin… Poti… Char… <NA> 
#> 
#> $Automatic.2
#> # A tibble: 0 × 8
#> # ℹ 8 variables: house <chr>, grade <chr>, hour <int>, mon <chr>, tue <chr>,
#> #   wed <chr>, thu <chr>, fri <chr>
#> 
#> $G.2
#> # A tibble: 5 × 8
#>   house grade  hour mon                           tue          wed   thu   fri  
#>   <chr> <chr> <int> <chr>                         <chr>        <chr> <chr> <chr>
#> 1 G     2         1 Transfiguration_McGonagall_NA History of … <NA>  Hist… <NA> 
#> 2 G     2         2 <NA>                          DADA_DADA T… Poti… Herb… Poti…
#> 3 G     2         3 Herbology_Sprout_NA           DADA_DADA T… Tran… Herb… Poti…
#> 4 G     2         6 <NA>                          <NA>         Char… DADA… <NA> 
#> 5 G     2         7 Charms_Flitwick_NA            <NA>         <NA>  <NA>  Tran…
#> 
#> $H.2
#> # A tibble: 5 × 8
#>   house grade  hour mon                           tue          wed   thu   fri  
#>   <chr> <chr> <int> <chr>                         <chr>        <chr> <chr> <chr>
#> 1 H     2         1 Transfiguration_McGonagall_NA Charms_Flit… Poti… Char… <NA> 
#> 2 H     2         2 History of Magic_Binns_NA     <NA>         DADA… Herb… <NA> 
#> 3 H     2         3 Herbology_Sprout_NA           <NA>         Tran… Herb… DADA…
#> 4 H     2         6 DADA_DADA Teacher_NA          Potions_Sna… Hist… <NA>  <NA> 
#> 5 H     2         7 <NA>                          Potions_Sna… <NA>  <NA>  Tran…
#> 
#> $R.2
#> # A tibble: 5 × 8
#>   house grade  hour mon                           tue          wed   thu   fri  
#>   <chr> <chr> <int> <chr>                         <chr>        <chr> <chr> <chr>
#> 1 R     2         1 <NA>                          History of … Poti… Hist… <NA> 
#> 2 R     2         2 <NA>                          <NA>         DADA… Tran… <NA> 
#> 3 R     2         3 Transfiguration_McGonagall_NA <NA>         <NA>  Tran… DADA…
#> 4 R     2         6 DADA_DADA Teacher_NA          Potions_Sna… Char… <NA>  Herb…
#> 5 R     2         7 Charms_Flitwick_NA            Potions_Sna… Herb… <NA>  Herb…
#> 
#> $S.2
#> # A tibble: 5 × 8
#>   house grade  hour mon                           tue          wed   thu   fri  
#>   <chr> <chr> <int> <chr>                         <chr>        <chr> <chr> <chr>
#> 1 S     2         1 <NA>                          Charms_Flit… <NA>  Char… <NA> 
#> 2 S     2         2 History of Magic_Binns_NA     DADA_DADA T… Poti… Tran… Poti…
#> 3 S     2         3 Transfiguration_McGonagall_NA DADA_DADA T… <NA>  Tran… Poti…
#> 4 S     2         6 <NA>                          <NA>         Hist… DADA… Herb…
#> 5 S     2         7 <NA>                          <NA>         Herb… <NA>  Herb…
#> 
#> $Automatic.3
#> # A tibble: 0 × 8
#> # ℹ 8 variables: house <chr>, grade <chr>, hour <int>, mon <chr>, tue <chr>,
#> #   wed <chr>, thu <chr>, fri <chr>
#> 
#> $G.3
#> # A tibble: 10 × 8
#>    house grade  hour mon                          tue          wed   thu   fri  
#>    <chr> <chr> <int> <chr>                        <chr>        <chr> <chr> <chr>
#>  1 G     3         1 Runes_Batsheda Babbling_3_E2 DADA_DADA T… <NA>  Care… Herb…
#>  2 G     3         1 Divination_Div Teacher_3_E2  <NA>         <NA>  <NA>  <NA> 
#>  3 G     3         2 Potions_Snape_NA             Care of Mag… Hist… DADA… Hist…
#>  4 G     3         3 Potions_Snape_NA             Care of Mag… Char… DADA… Tran…
#>  5 G     3         5 Charms_Flitwick_NA           <NA>         Poti… <NA>  Rune…
#>  6 G     3         5 <NA>                         <NA>         <NA>  <NA>  Divi…
#>  7 G     3         6 Herbology_Sprout_NA          Transfigura… Herb… Arit… Arit…
#>  8 G     3         6 <NA>                         <NA>         <NA>  Mugg… <NA> 
#>  9 G     3         7 Arithmancy_Vector_3_E1       Transfigura… Rune… Care… Char…
#> 10 G     3         7 Muggle Studies_Burbage_3_E1  <NA>         Divi… <NA>  <NA> 
#> 
#> $H.3
#> # A tibble: 10 × 8
#>    house grade  hour mon                                 tue   wed   thu   fri  
#>    <chr> <chr> <int> <chr>                               <chr> <chr> <chr> <chr>
#>  1 H     3         1 Charms_Flitwick_NA                  <NA>  <NA>  DADA… Herb…
#>  2 H     3         2 Care of Magical Creatures_CoMC tea… Poti… Char… Poti… Char…
#>  3 H     3         3 Care of Magical Creatures_CoMC tea… Poti… Rune… Care… Tran…
#>  4 H     3         3 <NA>                                <NA>  Divi… <NA>  <NA> 
#>  5 H     3         5 Runes_Batsheda Babbling_3_E2        DADA… Care… <NA>  Hist…
#>  6 H     3         5 Divination_Div Teacher_3_E2         <NA>  <NA>  <NA>  <NA> 
#>  7 H     3         6 Herbology_Sprout_NA                 Tran… Herb… Arit… Arit…
#>  8 H     3         6 <NA>                                <NA>  <NA>  Mugg… <NA> 
#>  9 H     3         7 Arithmancy_Vector_3_E1              Tran… Hist… DADA… Rune…
#> 10 H     3         7 Muggle Studies_Burbage_3_E1         <NA>  <NA>  <NA>  Divi…
#> 
#> $R.3
#> # A tibble: 10 × 8
#>    house grade  hour mon                                 tue   wed   thu   fri  
#>    <chr> <chr> <int> <chr>                               <chr> <chr> <chr> <chr>
#>  1 R     3         1 Runes_Batsheda Babbling_3_E2        <NA>  Tran… DADA… Arit…
#>  2 R     3         1 Divination_Div Teacher_3_E2         <NA>  <NA>  <NA>  Mugg…
#>  3 R     3         2 Care of Magical Creatures_CoMC tea… Poti… Hist… Poti… Hist…
#>  4 R     3         3 Care of Magical Creatures_CoMC tea… Poti… Char… Care… Herb…
#>  5 R     3         5 Charms_Flitwick_NA                  DADA… Care… Herb… Rune…
#>  6 R     3         5 <NA>                                <NA>  <NA>  <NA>  Divi…
#>  7 R     3         6 Arithmancy_Vector_3_E1              Herb… <NA>  <NA>  Tran…
#>  8 R     3         6 Muggle Studies_Burbage_3_E1         <NA>  <NA>  <NA>  <NA> 
#>  9 R     3         7 Transfiguration_McGonagall_NA       Arit… Rune… DADA… Char…
#> 10 R     3         7 <NA>                                <NA>  Divi… <NA>  <NA> 
#> 
#> $S.3
#> # A tibble: 11 × 8
#>    house grade  hour mon                           tue         wed   thu   fri  
#>    <chr> <chr> <int> <chr>                         <chr>       <chr> <chr> <chr>
#>  1 S     3         1 Charms_Flitwick_NA            DADA_DADA … Tran… Care… Arit…
#>  2 S     3         1 <NA>                          <NA>        <NA>  <NA>  Mugg…
#>  3 S     3         2 Potions_Snape_NA              Care of Ma… Char… DADA… Char…
#>  4 S     3         3 Potions_Snape_NA              Care of Ma… Rune… DADA… Herb…
#>  5 S     3         3 <NA>                          <NA>        Divi… <NA>  <NA> 
#>  6 S     3         5 Runes_Batsheda Babbling_3_E2  <NA>        Poti… Herb… Hist…
#>  7 S     3         5 Divination_Div Teacher_3_E2   <NA>        <NA>  <NA>  <NA> 
#>  8 S     3         6 Arithmancy_Vector_3_E1        Herbology_… <NA>  <NA>  Tran…
#>  9 S     3         6 Muggle Studies_Burbage_3_E1   <NA>        <NA>  <NA>  <NA> 
#> 10 S     3         7 Transfiguration_McGonagall_NA Arithmancy… Hist… Care… Rune…
#> 11 S     3         7 <NA>                          <NA>        <NA>  <NA>  Divi…
#> 
#> $Automatic.4
#> # A tibble: 0 × 8
#> # ℹ 8 variables: house <chr>, grade <chr>, hour <int>, mon <chr>, tue <chr>,
#> #   wed <chr>, thu <chr>, fri <chr>
#> 
#> $G.4
#> # A tibble: 11 × 8
#>    house grade  hour mon                                 tue   wed   thu   fri  
#>    <chr> <chr> <int> <chr>                               <chr> <chr> <chr> <chr>
#>  1 G     4         1 Herbology_Sprout_NA                 Poti… <NA>  Poti… DADA…
#>  2 G     4         2 <NA>                                <NA>  Arit… Char… <NA> 
#>  3 G     4         2 <NA>                                <NA>  Mugg… <NA>  <NA> 
#>  4 G     4         3 Charms_Flitwick_NA                  Char… Arit… Rune… Hist…
#>  5 G     4         3 <NA>                                <NA>  <NA>  Divi… <NA> 
#>  6 G     4         4 Arithmancy_Vector_4_E1              DADA… Herb… Rune… Herb…
#>  7 G     4         4 Muggle Studies_Burbage_4_E1         <NA>  <NA>  Divi… <NA> 
#>  8 G     4         5 Transfiguration_McGonagall_NA       Care… Hist… Care… Tran…
#>  9 G     4         6 Runes_Batsheda Babbling_4_E2        <NA>  <NA>  <NA>  <NA> 
#> 10 G     4         6 Divination_Div Teacher_4_E2         <NA>  <NA>  <NA>  <NA> 
#> 11 G     4         7 Care of Magical Creatures_CoMC tea… <NA>  Tran… Poti… DADA…
#> 
#> $H.4
#> # A tibble: 10 × 8
#>    house grade  hour mon                           tue         wed   thu   fri  
#>    <chr> <chr> <int> <chr>                         <chr>       <chr> <chr> <chr>
#>  1 H     4         1 Herbology_Sprout_NA           <NA>        Care… <NA>  Care…
#>  2 H     4         2 <NA>                          Runes_Bats… Arit… Rune… DADA…
#>  3 H     4         2 <NA>                          Divination… Mugg… Divi… <NA> 
#>  4 H     4         3 History of Magic_Binns_NA     Runes_Bats… Arit… <NA>  Char…
#>  5 H     4         3 <NA>                          Divination… <NA>  <NA>  <NA> 
#>  6 H     4         4 Arithmancy_Vector_4_E1        Care of Ma… Herb… Hist… Herb…
#>  7 H     4         4 Muggle Studies_Burbage_4_E1   <NA>        <NA>  <NA>  <NA> 
#>  8 H     4         5 Transfiguration_McGonagall_NA Potions_Sn… Char… Poti… Tran…
#>  9 H     4         6 Charms_Flitwick_NA            DADA_DADA … <NA>  Poti… <NA> 
#> 10 H     4         7 <NA>                          DADA_DADA … Tran… <NA>  <NA> 
#> 
#> $R.4
#> # A tibble: 12 × 8
#>    house grade  hour mon                           tue         wed   thu   fri  
#>    <chr> <chr> <int> <chr>                         <chr>       <chr> <chr> <chr>
#>  1 R     4         1 <NA>                          <NA>        Care… <NA>  Care…
#>  2 R     4         2 Transfiguration_McGonagall_NA <NA>        <NA>  Char… DADA…
#>  3 R     4         3 Charms_Flitwick_NA            Charms_Fli… Herb… Rune… Hist…
#>  4 R     4         3 <NA>                          <NA>        <NA>  Divi… <NA> 
#>  5 R     4         4 Herbology_Sprout_NA           Care of Ma… Tran… Rune… Tran…
#>  6 R     4         4 <NA>                          <NA>        <NA>  Divi… <NA> 
#>  7 R     4         5 Arithmancy_Vector_4_E1        Potions_Sn… Hist… Poti… Herb…
#>  8 R     4         5 Muggle Studies_Burbage_4_E1   <NA>        <NA>  <NA>  <NA> 
#>  9 R     4         6 Runes_Batsheda Babbling_4_E2  DADA_DADA … Arit… Poti… <NA> 
#> 10 R     4         6 Divination_Div Teacher_4_E2   <NA>        <NA>  <NA>  <NA> 
#> 11 R     4         7 <NA>                          DADA_DADA … Arit… <NA>  <NA> 
#> 12 R     4         7 <NA>                          <NA>        Mugg… <NA>  <NA> 
#> 
#> $S.4
#> # A tibble: 11 × 8
#>    house grade  hour mon                                 tue   wed   thu   fri  
#>    <chr> <chr> <int> <chr>                               <chr> <chr> <chr> <chr>
#>  1 S     4         1 <NA>                                Poti… <NA>  Poti… DADA…
#>  2 S     4         2 Transfiguration_McGonagall_NA       Rune… <NA>  Rune… <NA> 
#>  3 S     4         2 <NA>                                Divi… <NA>  Divi… <NA> 
#>  4 S     4         3 History of Magic_Binns_NA           Rune… Herb… <NA>  Char…
#>  5 S     4         3 <NA>                                Divi… <NA>  <NA>  <NA> 
#>  6 S     4         4 Herbology_Sprout_NA                 DADA… Tran… Hist… Tran…
#>  7 S     4         5 Arithmancy_Vector_4_E1              Care… Char… Care… Herb…
#>  8 S     4         5 Muggle Studies_Burbage_4_E1         <NA>  <NA>  <NA>  <NA> 
#>  9 S     4         6 Charms_Flitwick_NA                  <NA>  Arit… <NA>  <NA> 
#> 10 S     4         7 Care of Magical Creatures_CoMC tea… <NA>  Arit… Poti… DADA…
#> 11 S     4         7 <NA>                                <NA>  Mugg… <NA>  <NA> 
#> 
#> $Automatic.5
#> # A tibble: 0 × 8
#> # ℹ 8 variables: house <chr>, grade <chr>, hour <int>, mon <chr>, tue <chr>,
#> #   wed <chr>, thu <chr>, fri <chr>
#> 
#> $G.5
#> # A tibble: 10 × 8
#>    house grade  hour mon                                 tue   wed   thu   fri  
#>    <chr> <chr> <int> <chr>                               <chr> <chr> <chr> <chr>
#>  1 G     5         1 History of Magic_Binns_NA           Rune… Hist… Arit… <NA> 
#>  2 G     5         1 <NA>                                Divi… <NA>  Mugg… <NA> 
#>  3 G     5         2 <NA>                                Arit… Care… <NA>  Tran…
#>  4 G     5         2 <NA>                                Mugg… <NA>  <NA>  <NA> 
#>  5 G     5         3 <NA>                                Herb… DADA… Char… <NA> 
#>  6 G     5         4 Potions_Snape_NA                    Herb… DADA… Herb… Rune…
#>  7 G     5         4 <NA>                                <NA>  <NA>  <NA>  Divi…
#>  8 G     5         5 DADA_DADA Teacher_NA                Char… Tran… Rune… Poti…
#>  9 G     5         6 Care of Magical Creatures_CoMC tea… Char… Tran… <NA>  Poti…
#> 10 G     5         7 History of Magic_Binns_NA           <NA>  <NA>  Arit… Care…
#> 
#> $H.5
#> # A tibble: 9 × 8
#>   house grade  hour mon                         tue            wed   thu   fri  
#>   <chr> <chr> <int> <chr>                       <chr>          <chr> <chr> <chr>
#> 1 H     5         1 <NA>                        <NA>           Char… Arit… Rune…
#> 2 H     5         1 <NA>                        <NA>           <NA>  Mugg… <NA> 
#> 3 H     5         2 <NA>                        Arithmancy_Ve… <NA>  Hist… Tran…
#> 4 H     5         2 <NA>                        Muggle Studie… <NA>  <NA>  <NA> 
#> 5 H     5         3 DADA_DADA Teacher_NA        Herbology_Spr… Care… Hist… Divi…
#> 6 H     5         4 DADA_DADA Teacher_NA        Herbology_Spr… Care… Herb… Char…
#> 7 H     5         5 Potions_Snape_NA            History of Ma… Tran… <NA>  DADA…
#> 8 H     5         6 Potions_Snape_NA            Runes_Batshed… Tran… <NA>  Care…
#> 9 H     5         7 Divination_Div Teacher_5_E2 Runes_Batshed… Char… Arit… Poti…
#> 
#> $R.5
#> # A tibble: 11 × 8
#>    house grade  hour mon                       tue             wed   thu   fri  
#>    <chr> <chr> <int> <chr>                     <chr>           <chr> <chr> <chr>
#>  1 R     5         1 History of Magic_Binns_NA Runes_Batsheda… Hist… <NA>  <NA> 
#>  2 R     5         1 <NA>                      Divination_Div… <NA>  <NA>  <NA> 
#>  3 R     5         2 Arithmancy_Vector_5_E1    Herbology_Spro… <NA>  <NA>  Arit…
#>  4 R     5         2 <NA>                      <NA>            <NA>  <NA>  Mugg…
#>  5 R     5         3 DADA_DADA Teacher_NA      Transfiguratio… Care… Char… <NA> 
#>  6 R     5         4 DADA_DADA Teacher_NA      Transfiguratio… Care… Tran… Rune…
#>  7 R     5         4 <NA>                      <NA>            <NA>  <NA>  Divi…
#>  8 R     5         5 Potions_Snape_NA          Charms_Flitwic… Arit… Rune… DADA…
#>  9 R     5         5 <NA>                      <NA>            Mugg… <NA>  <NA> 
#> 10 R     5         6 Potions_Snape_NA          Charms_Flitwic… <NA>  Herb… Care…
#> 11 R     5         7 History of Magic_Binns_NA <NA>            <NA>  Herb… Poti…
#> 
#> $S.5
#> # A tibble: 9 × 8
#>   house grade  hour mon                                  tue   wed   thu   fri  
#>   <chr> <chr> <int> <chr>                                <chr> <chr> <chr> <chr>
#> 1 S     5         1 <NA>                                 <NA>  Char… <NA>  Rune…
#> 2 S     5         2 Arithmancy_Vector_5_E1               Herb… Care… Hist… Arit…
#> 3 S     5         2 <NA>                                 <NA>  <NA>  <NA>  Mugg…
#> 4 S     5         3 <NA>                                 Tran… DADA… Hist… Divi…
#> 5 S     5         4 Potions_Snape_NA                     Tran… DADA… Tran… Char…
#> 6 S     5         5 DADA_DADA Teacher_NA                 Hist… Arit… <NA>  Poti…
#> 7 S     5         5 <NA>                                 <NA>  Mugg… <NA>  <NA> 
#> 8 S     5         6 Care of Magical Creatures_CoMC teac… Rune… <NA>  Herb… Poti…
#> 9 S     5         7 Divination_Div Teacher_5_E2          Rune… Char… Herb… Care…
#> 
#> $Automatic.6
#> # A tibble: 7 × 8
#>   house     grade  hour mon                              tue   wed   thu   fri  
#>   <chr>     <chr> <int> <chr>                            <chr> <chr> <chr> <chr>
#> 1 Automatic 6         1 Muggle Studies_Burbage_NA        <NA>  Arit… Tran… Divi…
#> 2 Automatic 6         2 DADA_DADA Teacher_NA             <NA>  Rune… <NA>  Herb…
#> 3 Automatic 6         3 Arithmancy_Vector_NA             <NA>  <NA>  Poti… Rune…
#> 4 Automatic 6         4 Charms_Flitwick_NA               Poti… Char… Poti… Care…
#> 5 Automatic 6         5 Care of Magical Creatures_CoMC … Tran… DADA… Mugg… Char…
#> 6 Automatic 6         6 History of Magic_Binns_NA        Mugg… Divi… Hist… DADA…
#> 7 Automatic 6         7 Runes_Batsheda Babbling_NA       Herb… Care… Tran… Arit…
#> 
#> $G.6
#> # A tibble: 0 × 8
#> # ℹ 8 variables: house <chr>, grade <chr>, hour <int>, mon <chr>, tue <chr>,
#> #   wed <chr>, thu <chr>, fri <chr>
#> 
#> $H.6
#> # A tibble: 0 × 8
#> # ℹ 8 variables: house <chr>, grade <chr>, hour <int>, mon <chr>, tue <chr>,
#> #   wed <chr>, thu <chr>, fri <chr>
#> 
#> $R.6
#> # A tibble: 0 × 8
#> # ℹ 8 variables: house <chr>, grade <chr>, hour <int>, mon <chr>, tue <chr>,
#> #   wed <chr>, thu <chr>, fri <chr>
#> 
#> $S.6
#> # A tibble: 0 × 8
#> # ℹ 8 variables: house <chr>, grade <chr>, hour <int>, mon <chr>, tue <chr>,
#> #   wed <chr>, thu <chr>, fri <chr>
#> 
#> $Automatic.7
#> # A tibble: 7 × 8
#>   house     grade  hour mon                              tue   wed   thu   fri  
#>   <chr>     <chr> <int> <chr>                            <chr> <chr> <chr> <chr>
#> 1 Automatic 7         1 Care of Magical Creatures_CoMC … <NA>  Rune… Divi… Char…
#> 2 Automatic 7         2 Charms_Flitwick_NA               Tran… <NA>  <NA>  Care…
#> 3 Automatic 7         3 Runes_Batsheda Babbling_NA       <NA>  Poti… Arit… Arit…
#> 4 Automatic 7         4 Transfiguration_McGonagall_NA    Mugg… Poti… DADA… Poti…
#> 5 Automatic 7         5 Herbology_Sprout_NA              Arit… Herb… Tran… Mugg…
#> 6 Automatic 7         6 <NA>                             Hist… Care… Char… Rune…
#> 7 Automatic 7         7 DADA_DADA Teacher_NA             Divi… DADA… Mugg… Hist…
#> 
#> $G.7
#> # A tibble: 0 × 8
#> # ℹ 8 variables: house <chr>, grade <chr>, hour <int>, mon <chr>, tue <chr>,
#> #   wed <chr>, thu <chr>, fri <chr>
#> 
#> $H.7
#> # A tibble: 0 × 8
#> # ℹ 8 variables: house <chr>, grade <chr>, hour <int>, mon <chr>, tue <chr>,
#> #   wed <chr>, thu <chr>, fri <chr>
#> 
#> $R.7
#> # A tibble: 0 × 8
#> # ℹ 8 variables: house <chr>, grade <chr>, hour <int>, mon <chr>, tue <chr>,
#> #   wed <chr>, thu <chr>, fri <chr>
#> 
#> $S.7
#> # A tibble: 0 × 8
#> # ℹ 8 variables: house <chr>, grade <chr>, hour <int>, mon <chr>, tue <chr>,
#> #   wed <chr>, thu <chr>, fri <chr>
starwars %>%
  pivot(row = "homeworld", col = "species", value = "name", split = "sex")
#> $female
#> # A tibble: 15 × 9
#>    sex   homeworld Clawdite Human Kaminoan Mirialan Tholothian Togruta `Twi'lek`
#>    <chr> <chr>     <chr>    <chr> <chr>    <chr>    <chr>      <chr>   <chr>    
#>  1 fema… Alderaan  <NA>     Leia… <NA>     <NA>     <NA>       <NA>    <NA>     
#>  2 fema… Chandrila <NA>     Mon … <NA>     <NA>     <NA>       <NA>    <NA>     
#>  3 fema… Coruscant <NA>     Joca… <NA>     <NA>     Adi Gallia <NA>    <NA>     
#>  4 fema… Kamino    <NA>     <NA>  Taun We  <NA>     <NA>       <NA>    <NA>     
#>  5 fema… Mirial    <NA>     <NA>  <NA>     Luminar… <NA>       <NA>    <NA>     
#>  6 fema… Mirial    <NA>     <NA>  <NA>     Barriss… <NA>       <NA>    <NA>     
#>  7 fema… Naboo     <NA>     Cordé <NA>     <NA>     <NA>       <NA>    <NA>     
#>  8 fema… Naboo     <NA>     Dormé <NA>     <NA>     <NA>       <NA>    <NA>     
#>  9 fema… Naboo     <NA>     Padm… <NA>     <NA>     <NA>       <NA>    <NA>     
#> 10 fema… Ryloth    <NA>     <NA>  <NA>     <NA>     <NA>       <NA>    Ayla Sec…
#> 11 fema… Shili     <NA>     <NA>  <NA>     <NA>     <NA>       Shaak … <NA>     
#> 12 fema… Tatooine  <NA>     Beru… <NA>     <NA>     <NA>       <NA>    <NA>     
#> 13 fema… Tatooine  <NA>     Shmi… <NA>     <NA>     <NA>       <NA>    <NA>     
#> 14 fema… Zolan     Zam Wes… <NA>  <NA>     <NA>     <NA>       <NA>    <NA>     
#> 15 fema… <NA>      <NA>     Rey   <NA>     <NA>     <NA>       <NA>    <NA>     
#> 
#> $hermaphroditic
#> # A tibble: 1 × 3
#>   sex            homeworld Hutt                 
#>   <chr>          <chr>     <chr>                
#> 1 hermaphroditic Nal Hutta Jabba Desilijic Tiure
#> 
#> $male
#> # A tibble: 56 × 33
#>    sex   homeworld  Aleena Besalisk Cerean Chagrian Dug   Ewok  Geonosian Gungan
#>    <chr> <chr>      <chr>  <chr>    <chr>  <chr>    <chr> <chr> <chr>     <chr> 
#>  1 male  Alderaan   <NA>   <NA>     <NA>   <NA>     <NA>  <NA>  <NA>      <NA>  
#>  2 male  Alderaan   <NA>   <NA>     <NA>   <NA>     <NA>  <NA>  <NA>      <NA>  
#>  3 male  Aleen Min… Ratts… <NA>     <NA>   <NA>     <NA>  <NA>  <NA>      <NA>  
#>  4 male  Bespin     <NA>   <NA>     <NA>   <NA>     <NA>  <NA>  <NA>      <NA>  
#>  5 male  Bestine IV <NA>   <NA>     <NA>   <NA>     <NA>  <NA>  <NA>      <NA>  
#>  6 male  Cato Neim… <NA>   <NA>     <NA>   <NA>     <NA>  <NA>  <NA>      <NA>  
#>  7 male  Cerea      <NA>   <NA>     Ki-Ad… <NA>     <NA>  <NA>  <NA>      <NA>  
#>  8 male  Champala   <NA>   <NA>     <NA>   Mas Ame… <NA>  <NA>  <NA>      <NA>  
#>  9 male  Concord D… <NA>   <NA>     <NA>   <NA>     <NA>  <NA>  <NA>      <NA>  
#> 10 male  Corellia   <NA>   <NA>     <NA>   <NA>     <NA>  <NA>  <NA>      <NA>  
#> # ℹ 46 more rows
#> # ℹ 23 more variables: Human <chr>, Iktotchi <chr>, Kaleesh <chr>,
#> #   Kaminoan <chr>, `Kel Dor` <chr>, `Mon Calamari` <chr>, Muun <chr>,
#> #   Nautolan <chr>, Neimodian <chr>, `Pau'an` <chr>, Quermian <chr>,
#> #   Rodian <chr>, Skakoan <chr>, Sullustan <chr>, Toong <chr>, Toydarian <chr>,
#> #   Trandoshan <chr>, `Twi'lek` <chr>, Vulptereen <chr>, Wookiee <chr>,
#> #   Xexto <chr>, `Yoda's species` <chr>, Zabrak <chr>
#> 
#> $none
#> # A tibble: 6 × 3
#>   sex   homeworld Droid 
#>   <chr> <chr>     <chr> 
#> 1 none  Naboo     R2-D2 
#> 2 none  Tatooine  C-3PO 
#> 3 none  Tatooine  R5-D4 
#> 4 none  <NA>      IG-88 
#> 5 none  <NA>      R4-P17
#> 6 none  <NA>      BB8
msleep %>%
  pivot(row = "vore", col = "conservation", value = "name") %>%
  na2empty() %>%
  print(n = nrow(.))
#> # A tibble: 33 × 8
#>    vore      cd            domesticated   en             lc    nt    vu    `NA` 
#>    <chr>     <chr>         <chr>          <chr>          <chr> <chr> <chr> <chr>
#>  1 "carni"   "Pilot whale" "Dog"          "Tiger"        "Che… "Jag… "Nor… "Slo…
#>  2 "carni"   ""            "Domestic cat" ""             "Lon… ""    "Lio… "Bot…
#>  3 "carni"   ""            ""             ""             "Gra… ""    "Cas… "Gen…
#>  4 "carni"   ""            ""             ""             "Thi… ""    "Com… "Arc…
#>  5 "carni"   ""            ""             ""             "Nor… ""    ""    "Red…
#>  6 "herbi"   "Giraffe"     "Cow"          "Asian elepha… "Roe… "Mou… "Mon… "Thr…
#>  7 "herbi"   ""            "Guinea pig"   "Golden hamst… "Goa… "Hou… "Afr… "Wes…
#>  8 "herbi"   ""            "Chinchilla"   ""             "Tre… "Rou… "Bra… "Vol…
#>  9 "herbi"   ""            "Horse"        ""             "Gra… ""    ""    "Pot…
#> 10 "herbi"   ""            "Donkey"       ""             "Mon… ""    ""    "Cot…
#> 11 "herbi"   ""            "Rabbit"       ""             "Deg… ""    ""    "Eas…
#> 12 "herbi"   ""            "Sheep"        ""             "Lab… ""    ""    ""   
#> 13 "herbi"   ""            ""             ""             "Arc… ""    ""    ""   
#> 14 "herbi"   ""            ""             ""             "Thi… ""    ""    ""   
#> 15 "herbi"   ""            ""             ""             "Gol… ""    ""    ""   
#> 16 "insecti" ""            ""             "Giant armadi… "Big… ""    ""    "Lit…
#> 17 "insecti" ""            ""             ""             "Eas… ""    ""    "Sho…
#> 18 "omni"    ""            "Pig"          ""             "Gre… ""    ""    "Owl…
#> 19 "omni"    ""            ""             ""             "Gri… ""    ""    "Afr…
#> 20 "omni"    ""            ""             ""             "Sta… ""    ""    "Gal…
#> 21 "omni"    ""            ""             ""             "Les… ""    ""    "Hum…
#> 22 "omni"    ""            ""             ""             "Nor… ""    ""    "Mac…
#> 23 "omni"    ""            ""             ""             "Eur… ""    ""    "Chi…
#> 24 "omni"    ""            ""             ""             "Pat… ""    ""    "Bab…
#> 25 "omni"    ""            ""             ""             "Pot… ""    ""    "Afr…
#> 26 "omni"    ""            ""             ""             ""    ""    ""    "Squ…
#> 27 "omni"    ""            ""             ""             ""    ""    ""    "Ten…
#> 28 "omni"    ""            ""             ""             ""    ""    ""    "Tre…
#> 29 ""        ""            ""             ""             "Des… ""    ""    "Ves…
#> 30 ""        ""            ""             ""             "Roc… ""    ""    "Dee…
#> 31 ""        ""            ""             ""             ""    ""    ""    "Pha…
#> 32 ""        ""            ""             ""             ""    ""    ""    "Mol…
#> 33 ""        ""            ""             ""             ""    ""    ""    "Mus…
as_tibble(Titanic) %>%
  pivot(row = "Age", col = c("Sex", "Survived"), value = "n", split = "Class")
#> $`1st`
#> # A tibble: 2 × 6
#>   Class Age   Female_No Female_Yes Male_No Male_Yes
#>   <chr> <chr>     <dbl>      <dbl>   <dbl>    <dbl>
#> 1 1st   Adult         4        140     118       57
#> 2 1st   Child         0          1       0        5
#> 
#> $`2nd`
#> # A tibble: 2 × 6
#>   Class Age   Female_No Female_Yes Male_No Male_Yes
#>   <chr> <chr>     <dbl>      <dbl>   <dbl>    <dbl>
#> 1 2nd   Adult        13         80     154       14
#> 2 2nd   Child         0         13       0       11
#> 
#> $`3rd`
#> # A tibble: 2 × 6
#>   Class Age   Female_No Female_Yes Male_No Male_Yes
#>   <chr> <chr>     <dbl>      <dbl>   <dbl>    <dbl>
#> 1 3rd   Adult        89         76     387       75
#> 2 3rd   Child        17         14      35       13
#> 
#> $Crew
#> # A tibble: 2 × 6
#>   Class Age   Female_No Female_Yes Male_No Male_Yes
#>   <chr> <chr>     <dbl>      <dbl>   <dbl>    <dbl>
#> 1 Crew  Adult         3         20     670      192
#> 2 Crew  Child         0          0       0        0
diamonds %>%
  pivot(row = "cut", col = "color", value = "price", split = "clarity")
#> $I1
#> # A tibble: 176 × 9
#>    clarity cut       D     E     F     G     H     I     J
#>    <ord>   <ord> <int> <int> <int> <int> <int> <int> <int>
#>  1 I1      Fair   5460  2788  2809  2808  2892  2935  3011
#>  2 I1      Fair   5617  3692  3734  4167  2964  3011  4284
#>  3 I1      Fair  15964  1232  4320  4277  2968  3745  5083
#>  4 I1      Fair   2491  1262   584  4849  2999  4368  5240
#>  5 I1      Fair     NA  1273  4698  6315  3175  4704  5405
#>  6 I1      Fair     NA  1865  5554  6346  3504  5040  5430
#>  7 I1      Fair     NA  2036  6532  6377  3765  5074  5607
#>  8 I1      Fair     NA  2138  6753  6503  4140  5667  5733
#>  9 I1      Fair     NA  2571  7019  6597  4145  5696  5859
#> 10 I1      Fair     NA    NA   613  6817  4648  5750  6289
#> # ℹ 166 more rows
#> 
#> $SI2
#> # A tibble: 1,494 × 9
#>    clarity cut       D     E     F     G     H     I     J
#>    <ord>   <ord> <int> <int> <int> <int> <int> <int> <int>
#>  1 SI2     Fair   2848  2757  2759  2834  2763  2811  2789
#>  2 SI2     Fair   2885  2797  2815  2856  2777  2884  2992
#>  3 SI2     Fair   2974  2815  2867  2858  2818  2948  3119
#>  4 SI2     Fair   3003  2855  2958  2942  2823  3054  3149
#>  5 SI2     Fair   3079  2862  2964  3027  2825  3084  3199
#>  6 SI2     Fair   3205  2930  2996  3104  2846  3290  3246
#>  7 SI2     Fair   3304  2948  3062  3142  2856  3348  3302
#>  8 SI2     Fair   3384  2982  3146  3172  2875  3530  3403
#>  9 SI2     Fair   3473  3011  3170  3173  2883  3669  3984
#> 10 SI2     Fair   3634  3084  3210  3332  2912  3802  4056
#> # ℹ 1,484 more rows
#> 
#> $SI1
#> # A tibble: 1,828 × 9
#>    clarity cut       D     E     F     G     H     I     J
#>    <ord>   <ord> <int> <int> <int> <int> <int> <int> <int>
#>  1 SI1     Fair   3382  2885  2838  2782  2854  2804  2812
#>  2 SI1     Fair   3689  3332  2882  2841  2873  2856  2949
#>  3 SI1     Fair   3730  3407  2971  2964  3024  2873  3027
#>  4 SI1     Fair   3751  3508  3117  2993  3057  2875  3154
#>  5 SI1     Fair   3812  3696  3160  3052  3145  2912  3175
#>  6 SI1     Fair   3855  3743  3197  3145  3180  3280  3427
#>  7 SI1     Fair   3945  3891  3323  3250  3278  3337  3780
#>  8 SI1     Fair   4118   579  3326  3299  3282  3584  4123
#>  9 SI1     Fair   4252  4106  3387  3304  3285  3892  4147
#> 10 SI1     Fair   4276  4140  3437  3358  3387  3920  4838
#> # ℹ 1,818 more rows
#> 
#> $VS2
#> # A tibble: 1,526 × 9
#>    clarity cut       D     E     F     G     H     I     J
#>    <ord>   <ord> <int> <int> <int> <int> <int> <int> <int>
#>  1 VS2     Fair   2858   337  2762  3418  3226  2921  2811
#>  2 VS2     Fair   3077  2902  2805  4032  3375  3033  2815
#>  3 VS2     Fair   3931  2940  3172  4072  3538  3166  2854
#>  4 VS2     Fair   4107  3875  3750  4309  3593  3215  3190
#>  5 VS2     Fair   4277  4057  3837  4435  3658  3246  3422
#>  6 VS2     Fair   4439  4125  3931  4480  3697  3258  3443
#>  7 VS2     Fair   4765   581  3992  4838  3725  3265  3886
#>  8 VS2     Fair    592  4480  4229  4860  3733  3597  3980
#>  9 VS2     Fair   5078  4525  4312  4887  3819  4553   416
#> 10 VS2     Fair   5797  4550  4474  5161  4166  4695  5846
#> # ℹ 1,516 more rows
#> 
#> $VS1
#> # A tibble: 1,355 × 9
#>    clarity cut       D     E     F     G     H     I     J
#>    <ord>   <ord> <int> <int> <int> <int> <int> <int> <int>
#>  1 VS1     Fair   3047  2964  2859  2800  3500  3387  2875
#>  2 VS1     Fair    563  3276  2879  2998  3676  3763  2964
#>  3 VS1     Fair   7083  4770  3002  3756  3924  3801  3080
#>  4 VS1     Fair   1166  7392  3031  3806  4044  3951  7139
#>  5 VS1     Fair   2747   640  3039  4455  4368  4263  7186
#>  6 VS1     Fair     NA 15584  3750  4630  4455  4281  7819
#>  7 VS1     Fair     NA   361  4183  4864  4732  4328  9314
#>  8 VS1     Fair     NA   371   593  4892  5062  6727 13399
#>  9 VS1     Fair     NA   799  4984  5487  5242 11322 14402
#> 10 VS1     Fair     NA  1778  5833  5633  5460 12244 14750
#> # ℹ 1,345 more rows
#> 
#> $VVS2
#> # A tibble: 885 × 9
#>    clarity cut       D     E     F     G     H     I     J
#>    <ord>   <ord> <int> <int> <int> <int> <int> <int> <int>
#>  1 VVS2    Fair   3296  3813  3920  2959  4312  3074  2998
#>  2 VVS2    Fair   4040   586  4368  3323  4355  3288    NA
#>  3 VVS2    Fair   8716  5430  6863  4534  5171  7303    NA
#>  4 VVS2    Fair  10562  5551 16364  4928  7476  1401    NA
#>  5 VVS2    Fair    772  7553   693  6736   922  2117    NA
#>  6 VVS2    Fair    997  7918   743   629  1227  2131    NA
#>  7 VVS2    Fair   1011   738   757 13553  2500  2292    NA
#>  8 VVS2    Fair   1089   945  1902   369  2608  2351    NA
#>  9 VVS2    Fair   1980  1069  2088   819  2699    NA    NA
#> 10 VVS2    Fair     NA  1705  2484   833  2717    NA    NA
#> # ℹ 875 more rows
#> 
#> $VVS1
#> # A tibble: 578 × 9
#>    clarity cut       D     E     F     G     H     I     J
#>    <ord>   <ord> <int> <int> <int> <int> <int> <int> <int>
#>  1 VVS1    Fair  10752  2805  7960  2797  4115  4194  1691
#>  2 VVS1    Fair    875  8529 12648  3062    NA    NA    NA
#>  3 VVS1    Fair   1792  1012   740   790    NA    NA    NA
#>  4 VVS1    Fair     NA    NA  1011    NA    NA    NA    NA
#>  5 VVS1    Fair     NA    NA  1040    NA    NA    NA    NA
#>  6 VVS1    Good   4198   554  3018  2899  2877   571  4633
#>  7 VVS1    Good   4274  2990  3206  3072  3096  3741    NA
#>  8 VVS1    Good   4407   575   564  3188  4381  3972    NA
#>  9 VVS1    Good   5029   586  3310  3225  4763  4114    NA
#> 10 VVS1    Good   8239   597  3536  3380  4847  4187    NA
#> # ℹ 568 more rows
#> 
#> $IF
#> # A tibble: 362 × 9
#>    clarity cut       D     E     F     G     H     I     J
#>    <ord>   <ord> <int> <int> <int> <int> <int> <int> <int>
#>  1 IF      Fair   1208    NA  2861  1127    NA    NA    NA
#>  2 IF      Fair   1440    NA  3205  1849    NA    NA    NA
#>  3 IF      Fair   2211    NA  1166    NA    NA    NA    NA
#>  4 IF      Fair     NA    NA  2144    NA    NA    NA    NA
#>  5 IF      Good   3378   597  2980  3304  6703  3669  5361
#>  6 IF      Good   3509  6804  3393  3583 13248  3734  6299
#>  7 IF      Good  15081   612  9451  5771  1440   631   827
#>  8 IF      Good  15928   813  9660  5855  2404   886  1061
#>  9 IF      Good  16406   912  9867  8973    NA   945  2053
#> 10 IF      Good  17499  1052   633 13998    NA    NA    NA
#> # ℹ 352 more rows
```

## Citation

Toshikazu Matsumura (2023) Create Pivot Table Easily.
<https://github.com/matutosi/pivotea/>.
