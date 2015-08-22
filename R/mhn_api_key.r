#' Get or set MHN_API_KEY value
#'
#' The API wrapper functions in this package all rely on a MHN server API
#' key residing in the environment variable \code{MHN_API_KEY} or being
#' passed in as a parameter. The former is useful in simple deplpoyments
#' where there is only one MHN server. In such cases, the easiest way to
#' accomplish this is to set it in the `.Renviron` file in your
#' home directory.
#'
#' @param force Force setting a new MHN server API key for the current environment?
#' @return atomic character vector containing the MHN server API key
#' @export
mhn_api_key <- function(force = FALSE) {

  env <- Sys.getenv('MHN_API_KEY')
  if (!identical(env, "") && !force) return(env)

  if (!interactive()) {
    stop("Please set env var MHN_API_KEY to your MHN server API key",
      call. = FALSE)
  }

  message("Couldn't find env var MHN_API_KEY See ?mhn_api_key for more details.")
  message("Please enter your MHN server API key and press enter:")
  pat <- readline(": ")

  if (identical(pat, "")) {
    stop("MHN server API key entry failed", call. = FALSE)
  }

  message("Updating MHN_API_KEY env var to PAT")
  Sys.setenv(MHN_API_KEY = pat)

  pat

}
