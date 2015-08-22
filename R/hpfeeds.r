#' Getthe raw hpfeeds data collected over a specific channel.
#'
#' @param channel channel
#' @param hours_ago specify how long to go back for results (API default to \code{4})
#' @param limit number of results to return (API defaults to \code{1000})
#' @param api_key MHN API key. Will retrieve from the environment or one can
#'                be specified explicitly.
#' @return \code{list} with attacker data and query result metadata
#' @note The query API key is stripped from the query result metadata (if present)
#' @export
hp_feeds <- function(channel=NULL, hours_ago=NULL, limit=NULL,
                          api_key=mhn_api_key()) {

  params <- list(api_key=api_key)
  if (!is.null(channel)) params$channel <- channel
  if (!is.null(hours_ago)) params$hours_ago <- hours_ago
  if (!is.null(limit)) params$limit <- limit

  req <- GET(mhn_base_url, path="api/feed/", query=params)

  stop_for_status(req)

  res <- fromJSON(content(req, as="text"))

  if (!is.null(res$meta) & !is.null(res$meta$query)) res$meta$query$api_key <- NULL

  res

}

#' Get data for a specific hpfeed
#'
#' @param feed_id uuid of the feed to retrieve information for.
#' @param api_key MHN API key. Will retrieve from the environment or one can
#'                be specified explicitly.
#' @return \code{list} with feed data and query result metadata
#' @note The query API key is stripped from the query result metadata (if present)
#' @export
feed_info <- function(feed_id=NULL, api_key=mhn_api_key()) {

  params <- list(api_key=api_key)
  if (is.null(feed_id)) stop("'feed_id' is required", call.=FALSE)

  req <- GET(mhn_base_url, path=sprintf("api/feed/%s/", feed_id), query=params)

  stop_for_status(req)

  res <- fromJSON(content(req, as="text"))

  #if (!is.null(res$meta) & !is.null(res$meta$query)) res$meta$query$api_key <- NULL

  res

}
