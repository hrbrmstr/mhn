#' Get all collected metadata
#'
#' @param hours_ago specify how long to go back for results (API default to \code{4})
#' @param limit number of results to return (API defaults to \code{1000})
#' @param api_key MHN API key. Will retrieve from the environment or one can
#'                be specified explicitly.
#' @return \code{list} with query result metadata
#' @note The query API key is stripped from the query result metadata (if present)
#' @export
all_metadata <- function(hours_ago=NULL, limit=NULL,
                         api_key=mhn_api_key()) {

  params <- list(api_key=api_key)
  if (!is.null(hours_ago)) params$hours_ago <- hours_ago
  if (!is.null(limit)) params$limit <- limit

  req <- GET(mhn_base_url, path="api/metadata/", query=params)

  stop_for_status(req)

  res <- fromJSON(content(req, as="text"))

  if (!is.null(res$meta) & !is.null(res$meta$query)) res$meta$query$api_key <- NULL

  res

}

#' Get metadata for a specific id
#'
#' @param metadata_id metadata key
#' @param hours_ago specify how long to go back for results (API default to \code{4})
#' @param limit number of results to return (API defaults to \code{1000})
#' @param api_key MHN API key. Will retrieve from the environment or one can
#'                be specified explicitly.
#' @return \code{list} with query result metadata
#' @note The query API key is stripped from the query result metadata (if present)
#' @export
metadata_for <- function(metadata_id=NULL, hours_ago=NULL, limit=NULL,
                         api_key=mhn_api_key()) {

  params <- list(api_key=api_key)
  if (is.null(metadata_id)) stop("'metadata_id' is required", call.=FALSE)
  if (!is.null(hours_ago)) params$hours_ago <- hours_ago
  if (!is.null(limit)) params$limit <- limit

  req <- GET(mhn_base_url, path=sprintf("api/metadata/%s/", metadata_id), query=params)

  stop_for_status(req)

  res <- fromJSON(content(req, as="text"))

  if (!is.null(res$meta) & !is.null(res$meta$query)) res$meta$query$api_key <- NULL

  res

}

