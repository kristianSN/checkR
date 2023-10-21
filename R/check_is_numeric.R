

check_is_numeric <- function(x, condition_type = c("stop", "warning")) {

  condition_type <- rlang::arg_match(condition_type)

  if (is.numeric(x)) {
    return(invisible(TRUE))
  }

  signal_wrong_input_type(
    x,
    expected = "numeric",
    condition_type = condition_type
  )
}

# check_is_numeric("2", "stop")
# check_is_numeric("2", "warning")
