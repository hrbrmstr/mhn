#' Get normalized sessions/connection data
#'
#' @param honeypot use this to retrieve information for a specific honeypot. Leave
#'                 \code{NULL} for all honeypots
#' @param hours_ago specify how long to go back for results (API defaults to \code{4})
#' @param limit number of results to return (API defaults to \code{1000})
#' @param api_key MHN API key. Will retrieve from the environment or one can
#'                be specified explicitly.
#' @return \code{list} with session data and query result metadata
#' @note The query API key is stripped from the query result metadata (if present)
#' @export
sessions <- function(honeypot=NULL, hours_ago=NULL, limit=NULL,
                     api_key=mhn_api_key(),
                     api_url=mhn_base_url()) {

  params <- list(api_key=api_key)
  if (!is.null(honeypot)) params$honeypot <- honeypot
  if (!is.null(hours_ago)) params$hours_ago <- hours_ago
  if (!is.null(limit)) params$limit <- limit

  req <- GET(api_url, path="api/session/", query=params)

  stop_for_status(req)

  res <- fromJSON(content(req, as="text"))

  if (!is.null(res$meta) & !is.null(res$meta$query)) res$meta$query$api_key <- NULL

  res

}

#' Get data for a specific attack session
#'
#' @param session_id uuid of the session to retrieve information for.
#' @param api_key MHN API key. Will retrieve from the environment or one can
#'                be specified explicitly.
#' @return \code{list} with session data and query result metadata
#' @note The query API key is stripped from the query result metadata (if present)
#' @export
session_info <- function(session_id=NULL, api_key=mhn_api_key(),
                         api_url=mhn_base_url()) {


  params <- list(api_key=api_key)
  if (is.null(session_id)) stop("'session_id' is required", call.=FALSE)

  req <- GET(api_url, path=sprintf("api/session/%s/", session_id), query=params)

  stop_for_status(req)

  res <- fromJSON(content(req, as="text"))

  if (!is.null(res$meta) & !is.null(res$meta$query)) res$meta$query$api_key <- NULL

  res

}
