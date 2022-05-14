#' @importFrom rlang %||%
#' @importFrom magrittr %>%
get_parent_call <- function(level) {

  assertthat::assert_that(level > 0)

  calls <- rev(sys.calls())

  call_txt <- calls[level][[1]] %||%
    calls[length(calls)][[1]] %>%
    rlang::expr_text()

  call_txt

}

