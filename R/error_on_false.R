#' @title Invoke Formatted Error on FALSE check
#' @description Given a length 1 boolean `check`, invokes a
#'   formatted error if `check` is FALSE.
#'
#' @param check A length 1 boolean as a result of a predicate expression.
#' @param x the object to check
#' @param input_name the name of the input to check
#' @param var_name the name the user gave the input
#' @param expected a string describing what the input should be
#' @param allow_null allow check to pass if x is NULL
#' @param allow_na allow check to pass if any element of x is NA
#' @param call the call environment
#' @param class the class of the error
#'
#' @return Called for side-effect. Returns TRUE/FALSE invisibly.
error_on_false <- function(check,
                           x,
                           var_name,
                           input_name,
                           expected,
                           allow_null,
                           allow_na,
                           call,
                           class){

  if (allow_null & is.null(x)){
    return(invisible(TRUE))
  }

  if (!allow_na & any(is.na(x))){
    na_check <- FALSE
  } else {
    na_check <- TRUE
  }

  if (!check & na_check){
    cli::cli_abort(
      c(
        "!" = "{.var {input_name}} must be {expected}.",
        "i" = "{.var {var_name}} is of type: {.val {typeof(x)}}."
      ),
      call  = call,
      class = class
    )

    return(invisible(FALSE))
  } else {
    return(invisible(TRUE))
  }

}
