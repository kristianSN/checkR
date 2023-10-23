#' Check if a string is a string
#'
#' @param x A string
#'
#' @return invisible true if x is a string
#' @export
#'
#' @examples
#'   check_string("hello")
check_string <- function(
    x
    , allow_na = FALSE
    , allow_null = FALSE
    , call = rlang::caller_env()
){
  # There could be several options for na and null
  # like allow_na = (true/false)
  # or allow_na = c('fail', 'warn', 'ignore')
  # or allow = c('NA_character, NULL, ) # not sure if this is possible
  # if these should work for all checks - they should be in a sub function

  if(is.character(x) && length(x) == 1){
    return(invisible(TRUE))
  } else {
    cli::cli_abort(c(
      '!' = 'x must be a character of lenght 1',
      'i' = 'x was {.obj_type_friendly {x}}'
    )
    , .envir = call
    )
  }
}
