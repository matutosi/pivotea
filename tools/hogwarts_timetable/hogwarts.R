library(tidyverse)
  # library(pivotea)

hour <- tibble::tibble(Hour = c(paste0(rep("M", 4), 1:4), paste0(rep("A", 3), 1:3)), hour = c(5:7, 1:4))
wday <- tibble::tibble(wday = lubridate::wday(2:6, label = TRUE, abbr = FALSE, locale = "EN"), wd = tolower(stringr::str_sub(wday, 1, 3)))
stu <-
  "tools/hogwarts_timetable/student.tsv" %>%
  readr::read_tsv(show_col_types = FALSE) %>%
  tidyr::pivot_longer(-Hour, names_to = "house", values_to = "subject") %>%
  tidyr::separate(Hour, into = c("wday", "Hour")) %>%
  replace_col(hour) %>%
  dplyr::rename(hour = Hour) %>%
  dplyr::rename_with(tolower) %>%
  replace_col(wday) %>%
  dplyr::mutate(grade = stringr::str_sub(house, 1, 1)) %>%
  dplyr::mutate(house = stringr::str_sub(house, 2, 2))

stu2 <-
  "tools/hogwarts_timetable/student2.tsv" %>%
  readr::read_tsv(show_col_types = FALSE) %>%
  replace_col(hour) %>%
  dplyr::rename_with(tolower) %>%
  dplyr::rename(wday = day) %>%
  replace_col(wday) %>%
  tidyr::separate(subgroup, into = c("grade", "house"), extra = "drop")

dplyr::left_join(stu, stu2) %>%
  dplyr::distinct() %>%
  dplyr::filter(!is.na(subject)) %>%
  dplyr::filter(is.na(teacher)) %>%
  distinct(subject)

dplyr::left_join(stu, stu2) %>%
  dplyr::distinct(subject, teacher) %>%
  dplyr::arrange(subject, teacher) %>%
  print(n = nrow(.))

