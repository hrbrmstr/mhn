#' MHN url
#'
#' @param hours_ago specify how long to go back for results (API defaults to \code{4})
#' @param limit number of results to return (API defaults to \code{1000})
#' @param api_key MHN API key. Will retrieve from the environment or one can
#'                be specified explicitly.
#' @return \code{data.frame}
#' @note The query API key is stripped from the query result metadata (if present)
#' @export
mhn_url <- function(hours_ago=NULL, limit=NULL, api_key=mhn_api_key()) {

  params <- list(api_key=api_key)
  if (!is.null(hours_ago)) params$hours_ago <- hours_ago
  if (!is.null(limit)) params$limit <- limit

  req <- GET(mhn_base_url, path="api/url/", query=params)

  stop_for_status(req)

  res <- fromJSON(content(req, as="text"))

  if (!is.null(res$meta) & !is.null(res$meta$query)) res$meta$query$api_key <- NULL

  res

}

#' MHN file
#'
#' @param hours_ago specify how long to go back for results (API defaults to \code{4})
#' @param limit number of results to return (API defaults to \code{1000})
#' @param api_key MHN API key. Will retrieve from the environment or one can
#'                be specified explicitly.
#' @return \code{data.frame}
#' @note The query API key is stripped from the query result metadata (if present)
#' @export
mhn_file <- function(hours_ago=NULL, limit=NULL, api_key=mhn_api_key()) {

  params <- list(api_key=api_key)
  if (!is.null(hours_ago)) params$hours_ago <- hours_ago
  if (!is.null(limit)) params$limit <- limit

  req <- GET(mhn_base_url, path="api/file/", query=params)

  stop_for_status(req)

  res <- fromJSON(content(req, as="text"))

  if (!is.null(res$meta) & !is.null(res$meta$query)) res$meta$query$api_key <- NULL

  res

}

#' MHN dork
#'
#' @param hours_ago specify how long to go back for results (API defaults to \code{4})
#' @param limit number of results to return (API defaults to \code{1000})
#' @param api_key MHN API key. Will retrieve from the environment or one can
#'                be specified explicitly.
#' @return \code{data.frame}
#' @note The query API key is stripped from the query result metadata (if present)
#' @export
mhn_dork <- function(hours_ago=NULL, limit=NULL, api_key=mhn_api_key()) {

  params <- list(api_key=api_key)
  if (!is.null(hours_ago)) params$hours_ago <- hours_ago
  if (!is.null(limit)) params$limit <- limit

  req <- GET(mhn_base_url, path="api/dork/", query=params)

  stop_for_status(req)

  res <- fromJSON(content(req, as="text"))

  if (!is.null(res$meta) & !is.null(res$meta$query)) res$meta$query$api_key <- NULL

  res

}
