#' Get attacker (IP) statistics
#'
#' Returns information such as "first seen", "last seen", honeypots attacker
#' was found on, port used and overall counts.
#'
#' @param ip attacker IP address
#' @param hours_ago specify how long to go back for results (API default to \code{4})
#' @param limit number of results to return (API defaults to \code{1000})
#' @param api_key MHN API key. Will retrieve from the environment or one can
#'                be specified explicitly.
#' @return \code{list} with attacker data and query result metadata
#' @export
attacker_stats <- function(ip=NULL, hours_ago=NULL, limit=NULL,
                          api_key=mhn_api_key()) {

  params <- list(api_key=api_key)
  if (is.null(ip)) stop("'ip' is required", call.=FALSE)
  if (!is.null(hours_ago)) params$hours_ago <- hours_ago
  if (!is.null(limit)) params$limit <- limit

  req <- GET(mhn_base_url, path=sprintf("api/attacker_stats/%s/", ip), query=params)

  stop_for_status(req)

  res <- fromJSON(content(req, as="text"))

  res

}
