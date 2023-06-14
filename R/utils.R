#' Remove all NA rows like na.omit()
#' @inherit pivot
#' @export
na_row_omit <- function(df){
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

#' Remove all NA cols like na.omit()
#' @inherit pivot
#' @export
na_col_omit <- function(df){
  nr <- nrow(df)
  cnames <- colnames(df)
  selected <- 
    cnames %>%
    purrr::map(extract_col, df) %>%
    purrr::map_int(function(x) sum(is.na(x))) %>%
  #     purrr::map_int(na_count) %>%
    `!=`(nr)
  dplyr::select(df, dplyr::all_of(cnames[selected]))
}
#' Helper for na_col_omit()
#' @param x A vector
#' @return An integer
#' @export
na_count <- function(x){
  sum(is.na(x))
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
  df %>%
    dplyr::mutate_if(is.character, function(x){ tidyr::replace_na(x, "") })
}
