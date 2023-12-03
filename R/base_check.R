#' check helper
#'
#' @param x the variable to check
#' @param input_name the name of the input we are checking
#' @param var_name the variable name the user gave the input
#' @param func the function performing the check
#' @param expected a string describing what the input should be
#' @param call the call environment
#' @param class the class of the error
#'
#' @return invisible true/falses
check <- function(
    x
    , var_name
    , input_name
    , func
    , expected
    , call
    , class
){

  if (!func(x)){
    cli::cli_abort(c(
      "!" = "{.var {input_name}} must be {expected}",
      "i" = "{.var {var_name}} is {.val {x}}"
    )
    , call  = call
    , class = class
    )

    invisible(FALSE)
  } else {
    invisible(TRUE)
  }

}


