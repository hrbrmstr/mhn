#' Get IP metadata (mainly from \code{p0f} honeypot data)
#'
#' @param ip IP to query
#' @param hours_ago specify how long to go back for results (API default to \code{4})
#' @param limit number of results to return (API defaults to \code{1000})
#' @param api_key MHN API key. Will retrieve from the environment or one can
#'        be specified explicitly.
#' @param api_url MHN API server URL. Will retrieve from the environment or one
#'        can be specified explicitly
#' @return \code{list} with attacker data and query result metadata
#' @note The query API key is stripped from the query result metadata (if present)
#' @export
ip_metadata <- function(ip=NULL, hours_ago=NULL, limit=NULL,
                        api_key=mhn_api_key(),
                        api_url=mhn_base_url()) {

  params <- list(api_key=api_key)
  if (is.null(ip)) stop("'ip' is required", call.=FALSE)
  params$ip <- ip
  if (!is.null(hours_ago)) params$hours_ago <- hours_ago
  if (!is.null(limit)) params$limit <- limit

  req <- GET(api_url, path="api/metadata/", query=params)

  stop_for_status(req)

  res <- fromJSON(content(req, as="text"))

  if (!is.null(res$meta) & !is.null(res$meta$query)) res$meta$query$api_key <- NULL

  res

}
