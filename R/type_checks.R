.error_class = 'checkr_error'


#'  Check if a variable is integerish
#'
#' @param x the variable to check
#' @param .x_name the name of x in the parent environment
#' @param .call The caller enviroment, used to get the name of the function that called the check
#' @param .class The class of the error, defaults to 'checkr_error'
#'
#' @return TRUE invisibly if the variable is integerish
#'
#' @example
#' check_is_integerish(1)
check_is_integerish <- function(
    x
    , .x_name = rlang::caller_arg(x)
    , .call  = rlang::caller_env()
    , .class = .error_class
){
  check(
    x = x
    , input_name = 'x'
    , var_name = .x_name
    , func = rlang::is_integerish
    , expected = "integer like"
    , class = .class
    , call = .call
  )
}


#' @describeIn check_is_integerish check that a variable is numeric
check_is_numeric <- function(
    x
    , .x_name = rlang::caller_arg(x)
    , .call  = rlang::caller_env()
    , .class = .error_class
){
  check(
    x = x
    , input_name = 'x'
    , var_name = .x_name
    , func = is.numeric
    , expected = "numeric"
    , class = .class
    , call = .call
  )
}


