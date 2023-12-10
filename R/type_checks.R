.error_class = 'checkr_error'


#'  Check if a variable is integerish
#'
#' @param x the variable to check
#' @param allow_null allow check to pass if x is null
#' @param allow_na allow chechk to pass if x contains na
#' @param .x_name the name of x in the parent environment
#' @param .call The caller enviroment, used to get the name of the function that called the check
#' @param .class The class of the error, defaults to 'checkr_error'
#'
#' @return TRUE invisibly if the variable is integerish
#'
#' @export
#' @example
#' check_is_integerish(1)
check_is_integerish <- function(
    x
    , allow_null = FALSE
    , allow_na = TRUE
    , .x_name = rlang::caller_arg(x)
    , .call  = rlang::caller_env()
    , .class = .error_class
){
  error_on_false(
    check = rlang::is_integerish(x)
    , x = x
    , input_name = 'x'
    , allow_null = allow_null
    , allow_na = allow_na
    , var_name = .x_name
    , expected = "integer like"
    , class = .class
    , call = .call
  )
}


#' @describeIn check_is_integerish check that a variable is numeric
#' @export
check_is_numeric <- function(
    x
    , allow_null = FALSE
    , allow_na = TRUE
    , .x_name = rlang::caller_arg(x)
    , .call  = rlang::caller_env()
    , .class = .error_class
){
  error_on_false(
    check = is.numeric(x)
    , x = x
    , input_name = 'x'
    , allow_null = allow_null
    , allow_na = allow_na
    , var_name = .x_name
    , expected = "numeric"
    , class = .class
    , call = .call
  )
}


