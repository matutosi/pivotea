#' Pivot easily by specifying rows, columns, values and split.
#' @name pivot
#' @param df         A dataframe.
#' @param row,value  A string or string vector.
#' @param col        A string or string vector.
#' @param split      A string or string vector.
#' @param sep        A string for separator.
#' @return A dataframe.
#' @examples
#' library(tidyr)
#' library(dplyr)
#' library(purrr)
#' library(ggplot2)
#' starwars %>%
#'   pivot(row = "homeworld", col = "species", value = "name", split = "sex")
#' msleep %>%
#'   pivot(row = "vore", col = "conservation", value = "name") %>%
#'   na2empty() %>%
#'   print(n = nrow(.))
#' as_tibble(Titanic) %>%
#'   pivot(row = "Age", col = c("Sex", "Survived"), value = "n", split = "Class")
#' diamonds %>%
#'   pivot(row = "cut", col = "color", value = "price", split = "clarity")
#' 
#' @export
pivot <- function(df, row, col, value, split = NULL, sep = "_"){
  cols <- c(row, col, value, split)
  validate_col(df, cols)

  if(length(value) > 1){
    vals <- paste0(value, collapse = sep)
    df <- tidyr::unite(df, {{vals}}, dplyr::all_of(value), sep = sep, remove = FALSE)
    value <- vals
    cols <- c(row, col, value, split)
  }

  tmp_col <- "tmp_col"
  df <-
    df %>%
    dplyr::distinct(dplyr::pick(dplyr::all_of(cols))) %>%
    split_force(split) %>%
    purrr::map(add_group_sub, c(row, col), sep = sep, tmp_col = tmp_col) %>%
    purrr::map(tidyr::pivot_wider, 
      names_from = dplyr::all_of(col), 
      names_sep = sep, names_sort = TRUE, names_expand = TRUE,
      values_from = dplyr::all_of(value)) %>%
    purrr::map(dplyr::arrange, dplyr::across(dplyr::all_of(row))) %>%
    purrr::map(dplyr::select, -dplyr::all_of(tmp_col)) %>%
    purrr::map(dplyr::relocate, dplyr::any_of(split))

  if(is.null(split)){ df <- df[[1]] }
  return(df)
}

#' Add sub index within group
#' @param group   A string or string vector.
#'                When vector, the first string will be used for 
#'                adding sub index.
#' @param tmp_col A string of colnames for temporary use.
#' @inherit pivot
#' @examples
#' library(dplyr)
#' add_group_sub(mtcars, c("am", "gear"))
#' add_group_sub(mtcars, c("cyl", "am"))
#' 
#' @export
add_group_sub <- function(df, group, sep = "_", tmp_col = "tmp_col"){
  g <- group[1]
  df %>%
    dplyr::group_by(dplyr::pick(dplyr::all_of(group))) %>%
    dplyr::mutate({{tmp_col}} := paste0(.data[[g]], sep, dplyr::row_number())) %>%
    dplyr::ungroup()
}

#' Validate col
#' @inherit pivot
#' @export
validate_col <- function(df, col){
  if(!has_col(df, col)){
    stop("df should has all cols")
  }
  return(df)
}

#' Split by force with "" when split is NULL
#' @inherit pivot
#' @examples
#' split_force(mtcars, split = NULL)
#' split_force(mtcars, split = c("cyl"))
#' 
#' @export
split_force <- function(df, split){
  if(is.null(split)){
    df <- base::split(df, "")
  }else{
    df <- base::split(df, df[split])
  }
  return(df)
}
