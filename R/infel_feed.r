#' Get intel feed
#'
#' @param hours_ago specify how long to go back for results (API defaults to \code{4})
#' @param limit number of results to return (API defaults to \code{1000})
#' @param api_key MHN API key. Will retrieve from the environment or one can
#'        be specified explicitly.
#' @param api_url MHN API server URL. Will retrieve from the environment or one
#'        can be specified explicitly
#' @return \code{data.frame}
#' @note The query API key is stripped from the query result metadata (if present)
#' @export
intel_feed <- function(hours_ago=NULL, limit=NULL, api_key=mhn_api_key(),
                       api_url=mhn_base_url()) {

  params <- list(api_key=api_key)
  if (!is.null(hours_ago)) params$hours_ago <- hours_ago
  if (!is.null(limit)) params$limit <- limit

  req <- GET(api_url, path="api/intel_feed.csv/", query=params)

  stop_for_status(req)

  read.table(text=content(req, as="text"), header=TRUE, stringsAsFactors=FALSE)

}
