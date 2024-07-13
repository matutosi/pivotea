## code to prepare `hogwarts` dataset goes here

library(tidyverse)
devtools::load_all(".")

hour <-
  tibble::tibble(
    hour = c(paste0(rep("M", 4), 1:4),
    paste0(rep("A", 3), 1:3)), h = c(5:7, 1:4))
wday <-
  tibble::tibble(
    wday = lubridate::wday(2:6, label = TRUE, abbr = FALSE, locale = "EN"),
    wd = ordered(tolower(stringr::str_sub(wday, 1, 3)), levels = tolower(stringr::str_sub(wday, 1, 3))))

url <- "https://github.com/Arcfej/HogwartsTimetable/raw/master/GeneratedTimetable.xlsx"
tmp <- fs::file_temp(ext = "xlsx")
curl::curl_download(url, tmp)
hogwarts <-
  readxl::read_xlsx(tmp, sheet = "Students", range = "A1:F2801") |>
  dplyr::rename_with(tolower) |>
  replace_col(hour) |>
  dplyr::rename(wday = day) |>
  replace_col(wday) |>
  tidyr::separate(subgroup, into = c("grade", "house"), extra = "drop") |>
  dplyr::filter(!is.na(subject) & !is.na(teacher)) |>
  dplyr::distinct()

usethis::use_data(hogwarts, overwrite = TRUE)
