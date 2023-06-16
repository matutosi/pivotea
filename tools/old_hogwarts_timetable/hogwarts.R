  # https://github.com/Arcfej/HogwartsTimetable/raw/master/GeneratedTimetable.xlsx

library(tidyverse)
devtools::load_all(".")

hour <- tibble::tibble(hour = c(paste0(rep("M", 4), 1:4), paste0(rep("A", 3), 1:3)), h = c(5:7, 1:4))
wday <- tibble::tibble(wday = lubridate::wday(2:6, label = TRUE, abbr = FALSE, locale = "EN"), wd = tolower(stringr::str_sub(wday, 1, 3)))


## 
stu2 <-
  "tools/hogwarts_timetable/student2.tsv" %>%
  readr::read_tsv(show_col_types = FALSE) %>%
  dplyr::rename_with(tolower) %>%
  replace_col(hour) %>%
  dplyr::rename(wday = day) %>%
  replace_col(wday) %>%
  tidyr::separate(subgroup, into = c("grade", "house"), extra = "drop") %>%
  dplyr::filter(!is.na(subject) & !is.na(teacher))



## Referential
stu <-
  "tools/hogwarts_timetable/student.tsv" %>%
  readr::read_tsv(show_col_types = FALSE) %>%
  tidyr::pivot_longer(-Hour, names_to = "house", values_to = "subject") %>%
  tidyr::separate(Hour, into = c("wday", "hour")) %>%
  replace_col(hour) %>%
  replace_col(wday) %>%
  dplyr::mutate(grade = stringr::str_sub(house, 1, 1)) %>%
  dplyr::mutate(house = stringr::str_sub(house, 2, 2))

dplyr::left_join(stu, stu2) %>%
  dplyr::distinct() %>%
  dplyr::filter(!is.na(subject)) %>%
  dplyr::filter(is.na(teacher)) %>%
  distinct(subject)

dplyr::left_join(stu, stu2) %>%
  dplyr::distinct(subject, teacher) %>%
  dplyr::arrange(subject, teacher) %>%
  print(n = nrow(.))

## Referential
tea <-
  "tools/hogwarts_timetable/teacher.tsv" %>%
  readr::read_tsv(show_col_types = FALSE) %>%
  tidyr::pivot_longer(-Hours, names_to = "teacher", values_to = "grade") %>%
  tidyr::separate(Hours, into = c("wday", "hour")) %>%
  replace_col(hour) %>%
  replace_col(wday) %>%
  tidyr::separate(grade, into = c("grade_1", "grade_2"), fill = "right") %>%
  tidyr::pivot_longer(c(grade_1, grade_2), names_to = "tmp", values_to = "house") %>%
  dplyr::select(-tmp) %>%
  dplyr::mutate(grade = stringr::str_sub(house, 1, 1)) %>%
  dplyr::mutate(house = stringr::str_sub(house, 2, 2))

tea2 <-
  "tools/hogwarts_timetable/teacher2.tsv" %>%
  readr::read_tsv(show_col_types = FALSE) %>%
  dplyr::rename_with(tolower) %>%
  dplyr::arrange(teacher, day, hour) %>%
  dplyr::group_by(teacher, day, hour) %>%
  tidyr::fill(room, .direction = "up") %>%
  tidyr::fill(subject, .direction = "down") %>%
  replace_col(hour) %>%
  dplyr::rename(wday = day) %>%
  replace_col(wday)
