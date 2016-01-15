#' Get or set MHN_BASE_URL value
#'
#' The API wrapper functions in this package all rely on acess to an MHN
#' API server. Ths URL for the server is expected to be specified in
#' the environment variable \code{MHN_BASE_URL} or being
#' passed in as a parameter. The former is useful in simple deplpoyments
#' where there is only one MHN server. In such cases, the easiest way to
#' accomplish this is to set it in the `.Renviron` file in your
#' home directory.
#'
#' @param force Force setting a new MHN server API key for the current environment?
#' @return atomic character vector containing the MHN server API key
#' @export
mhn_base_url <- function(force = FALSE) {

  env <- Sys.getenv('MHN_BASE_URL')
  if (!identical(env, "") && !force) return(env)

  if (!interactive()) {
    stop("Please set the URL fore the MHN API server in env var MHN_BASE_URL",
         call. = FALSE)
  }

  message("Couldn't find env var MHN_BASE_URL See ?mhn_base_url for more details.")
  message("Please enter your MHN API erver URL press enter:")
  URL <- readline(": ")

  if (identical(URL, "")) {
    stop("MHN API server URL entry failed", call. = FALSE)
  }

  message("Updating MHN_BASE_URL env var...")
  Sys.setenv(MHN_BASE_URL = URL)

  URL

}
