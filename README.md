
<!-- README.md is generated from README.Rmd. Please edit that file -->

# pivoteasy

<!-- badges: start -->
<!-- badges: end -->

The goal of pivoteasy is to make pivot table easily by specifying rows,
columns, values and split.

## Installation

You can install the development version of pivoteasy from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("matutosi/pivoteasy")
```

You can also install from CRAN:

``` r
install.packages("pivoteasy")
```

## Example

You can use pivot to make a pivot table easily.

``` r
library(pivoteasy)
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
<https://github.com/matutosi/pivoteasy/>.
