signal_wrong_input_type <- function(x,
                                    expected,
                                    ...,
                                    condition_type,
                                    arg = rlang::caller_arg(x),
                                    call_env = parent.frame()
                                    ) {

  message <- c(
    "!" = "{.var {arg}} must be a {expected} vector.",
    "x" = "You've supplied a {.cls {class(x)}} vector."
  )

  switch(
    condition_type,
    "stop" = cli::cli_abort(
      message,
      ...,
      call = call_env,
      .frame = call_env
    ),
    "warning" = cli::cli_warn(
      message,
      ...,
      call = call_env
    )
  )

}
