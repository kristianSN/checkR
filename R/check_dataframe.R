# possible syntax with data.masking but what about tidy selectors
# iris |>
#  has_columns(Sepal.Length, Sepal.Width, Petal.Length, Petal.Width) |>
#  check_column_type(Sepal.Length, Sepal.Width, Petal.Length, Petal.Width, type = 'string') |>
#  check_column_data()
#


#' Check data.frame
#'
#' @param .data data.frame like object
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
column_is_numeric <- function(.data, ...) {
  test <- rlang::enquos(...)
  return(test)
}

column_is_numeric(iris, Sepal.lenght, Sepal.Width)

