#' Remove all NA rows
#' @inherit pivot
#' @export
omit_na_rows <- function(df){
  non_na <- list()
  for(i in seq(nrow(df))){
    non_na[[i]] <- sum(!is.na(df[i,])) > 0
  }
  df[unlist(non_na),]
}

#' Detect if df has col
#' @inherit pivot
#' @examples
#' colnames(mtcars)
#' has_col(mtcars, c("mpg", "cyl"))
#' has_col(mtcars, c("mpg", "foo"))
#' 
#' @export
has_col <- function(df, col){
  diff <- setdiff(col, colnames(df))
  len <- length(diff)
  if(len > 0){
    warning("not found col ", paste0(diff, collapse = ", "), " in ", quote(df))
    return(FALSE)
  }
  return(TRUE)
}

#' Remove all NA cols
#' @inherit pivot
#' @export
omit_na_cols <- function(df){
  nr <- nrow(df)
  cnames <- colnames(df)
  nas <- 
    cnames |>
    purrr::map(extract_col, df) |>
    purrr::map_int(function(x) sum(is.na(x)))
  non_na <- nas != nr
  dplyr::select(df, dplyr::all_of(cnames[non_na]))
}

#' Helper for na_col_omit()
#' @inherit pivot
#' @return A vector.
#' @export
extract_col <- function(col, df){
  df[[col]]
}

#' replace NA character into ""
#' @inherit pivot
#' @export
na2empty <- function(df){
  df |>
    dplyr::mutate_if(is.character, function(x){ tidyr::replace_na(x, "") })
}

#' Replace a col with a data.frame.
#' @param df,replace         A dataframe.
#' @return A dataframe.
#' @examples
#' (state <- tibble::tibble(state = state.name, area = state.area))
#' (abb <- tibble::tibble(state = state.name, abb = state.abb))
#' replace_col(state, abb)
#' 
#' @export
replace_col <- function(df, replace){
  common <-  intersect(colnames(replace), colnames(df))
  new_col <- setdiff(colnames(replace),  colnames(df))
  if(common == ""){
    warning("No common col !")
    return(NULL)
  }
  df <- 
    df |>
    dplyr::left_join(replace) |>
    dplyr::select(-dplyr::all_of(common)) |>
    dplyr::mutate(`:=`({{common}}, .data[[new_col]])) |>
    dplyr::select(-dplyr::all_of(new_col)) |>
    dplyr::relocate(dplyr::all_of(colnames(df)))
  return(df)
}
