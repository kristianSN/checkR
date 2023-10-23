

checkr_type <- function(x, call = rlang::caller_env()){
  checkr_typish(x, 'type', typeof, call = call)
}

checkr_mode <- function(x, call = rlang::caller_env()){
  checkr_typish(x, 'mode', mode, call = call)
}

#' Check if an object is of a certain type
checkr_typish <- function(
  x
  , expected
  , .f
  , call = rlang::caller_env()
) {

  if(.f(x) == expected){
    return(invisible(TRUE))
  }

  cli::cli_abort(
    message = c(
      '!' = 'x must be a {expected}',
      'i' = 'x was {(.f(x))}'
    )
    , call = call
  )
}
