
#' @title Check That a Set of Conditions are True
#'
#' @description
#' Checks that a set of provided conditions are true and returns
#' informative error messages including a notice of where in the
#' call stack, the check failed. This is essentially a
#' wrapper around the assertthat package functionality, but allowing
#' the handler message to be prefixed with a function name in the
#' call stack. This means error or warning messages combine the
#' informative messaging from the assertthat package, while also
#' giving hints to the function call that contains the failed
#' check.
#'
#' @details
#' Under the hood \code{check()} is a wrapper around the
#' \code{see_if()} function from the assertthat package. This means
#' \code{check()} works similar to \code{assert_that()}, and
#' also with the utility functions of the assertthat package.
#'
#' **Call-stack function messaging**:
#'
#' The addition that \code{check()} makes is that
#' messages start with a function call from
#' the call stack. This helps the user to identify in
#' which function a certain check failed. The default call
#' is the function call containing the check call
#' (cs_level = 1). That is, if a function A
#' contains a check that fails, calling \code{A()}, will
#' cause an error or warning with a message specifying that
#' a check failed in \code{A()}.
#'
#' The call-stack in check is reversed, meaning that
#' it starts at the check call (0) and goes up the
#' call stack progressively with *cs_level*.
#'
#' @param ... logical expressions to evaluate.
#' See \link[assertthat]{assert_that}.
#'
#' @param cs_level \code{integer}. Indicater of how far up the
#' call-stack, the message should look for the call to report.
#' By default (1) check reports on parent function (
#' the function calling the check function). A level of 2 means
#' that check reports on the grandparent function. And so on.
#' See details.
#'
#' @param msg \code{character} of length 1. A custom
#' message to overwrite the default assertthat message.
#'
#' @param handler \code{character} of length 1. One of
#' 'stop' or 'warning'. Should failed check result in
#' errors or warnings?
#'
#' @return TRUE if the check passed. Side-effect error or
#' warning otherwise.
#'
#' @export
#'
#'
check <- function(...,
                  cs_level = 1,
                  msg = NULL,
                  handler = "stop") {

  assertthat::assert_that(
    handler %in% c("stop", "warning"),
    msg = "handler not in either 'stop' or 'warning'."
  )

  res <- assertthat::see_if(..., msg = msg)

  if(res) return(TRUE)

  parent_call <- get_parent_call(cs_level + 2)

  handler <- getFromNamespace(handler, ns = "base")

  handler(
    create_err_msg(
      assert_msg = attr(res, "msg"),
      parent_call = parent_call,
      custom_msg = msg
    ),
    call. = FALSE
  )

}

#' Create Error Message
#' @noRd
#' @importFrom rlang %||%
create_err_msg <- function(assert_msg,
                           parent_call,
                           custom_msg) {

  assertthat::assert_that(
    assertthat::is.string(assert_msg),
    assertthat::is.string(parent_call),
    is.null(custom_msg) | assertthat::is.string(custom_msg)
  )

  err_msg <- custom_msg %||%
    assert_msg

  paste0(
    "Check failed in ",
    parent_call,
    ". \n",
    err_msg
  )

}
