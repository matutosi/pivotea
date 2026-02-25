# Timetable in Hogwarts School of Witchcraft and Wizardry.

Timetable in Hogwarts School of Witchcraft and Wizardry.

## Usage

``` r
hogwarts
```

## Format

A data frame with 548 rows and 7 variable:

- grade:

  Grades in school.

- house:

  Houses. G: Gryffindor, S: Slytherin, R: Ravenclaw, and H: Hufflepuff.

- wday:

  Abbreviations of day of the week.

- hour:

  Hours.

- teacher:

  Teachers.

- subject:

  Subjects.

- room:

## Examples

``` r
data(hogwarts)
hogwarts
#> # A tibble: 548 × 7
#>    grade house wday   hour teacher      subject          room 
#>    <chr> <chr> <ord> <int> <chr>        <chr>            <chr>
#>  1 1     G     mon       1 DADA Teacher DADA             NA   
#>  2 1     G     mon       2 Sprout       Herbology        NA   
#>  3 1     G     tue       7 Flitwick     Charms           NA   
#>  4 1     G     tue       1 McGonagall   Transfiguration  NA   
#>  5 1     G     tue       2 Binns        History of Magic NA   
#>  6 1     G     wed       6 Snape        Potions          NA   
#>  7 1     G     wed       7 Snape        Potions          NA   
#>  8 1     G     wed       2 Sprout       Herbology        NA   
#>  9 1     G     thu       6 McGonagall   Transfiguration  NA   
#> 10 1     G     thu       7 Binns        History of Magic NA   
#> # ℹ 538 more rows
```
