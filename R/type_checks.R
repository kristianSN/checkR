.error_class <- 'checkr_error'


#' @title Type checks
#' @description Performs type checks on an object, invoking a
#'   formatted error message containing the calling environment,
#'   if the object is not of the expected type.
#' @param x the object to check
#' @param allow_null allow check to pass if x is NULL
#' @param allow_na allow check to pass if x contains na
#' @param .x_name the name of x in the parent environment
#' @param .call The caller environment, used to get the name of the function that called the check
#' @param .class The class of the error, defaults to 'checkr_error'
#' @name type_check
#' @return Called for side-effect. Returns TRUE invisibly if the check passes.
#'   Invisibly FALSE otherwise.
NULL

#' @describeIn type_check Checks whether an object is an  `integerish`.
#'   See the rlang-function \link[rlang]{is_integerish} for the implementation of
#'   `integerish`.
#' @export
#' @importFrom rlang is_integerish
#' @examples
#' library(checkR)
#' check_is_integerish(1)
check_is_integerish <- function(x,
                                allow_null = FALSE,
                                allow_na = TRUE,
                                .x_name = rlang::caller_arg(x),
                                .call  = rlang::caller_env(),
                                .class = .error_class){
  error_on_false(
    check = is_integerish(x),
    x = x,
    input_name = 'x',
    var_name = .x_name,
    expected = "integer like",
    allow_null = allow_null,
    allow_na = allow_na,
    class = .class,
    call = .call
  )
}


#' @describeIn type_check Checks whether an object is a numeric vector.
#' @export
#' @examples
#' check_is_numeric(2L)
#' check_is_numeric(2.5)
#'
check_is_numeric <- function(x,
                             allow_null = FALSE,
                             allow_na = TRUE,
                             .x_name = rlang::caller_arg(x),
                             .call  = rlang::caller_env(),
                             .class = .error_class){
  error_on_false(
    check = is.numeric(x),
    x = x,
    input_name = 'x',
    var_name = .x_name,
    expected = "numeric",
    allow_null = allow_null,
    allow_na = allow_na,
    class = .class,
    call = .call
  )
}

#' @describeIn type_check Checks whether an object is a character vector. Uses
#'   the character definition from rlang. See \link[rlang]{is_character}.
#' @export
#' @examples
#' check_is_character("3")
#' @importFrom rlang is_character
#'
check_is_character <- function(x,
                               allow_null = FALSE,
                               allow_na = TRUE,
                               .x_name = rlang::caller_arg(x),
                               .call  = rlang::caller_env(),
                               .class = .error_class){
  error_on_false(
    check = is_character(x),
    x = x,
    input_name = 'x',
    var_name = .x_name,
    expected = "character",
    allow_null = allow_null,
    allow_na = allow_na,
    class = .class,
    call = .call
  )
}
