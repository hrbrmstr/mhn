#' Analyze and Visualize Data from Modern Honey Network Servers
#'
#' The API wrapper functions in this package all rely on a MHN server API
#' key residing in the environment variable \code{MHN_API_KEY} or being
#' passed in as a parameter. The former is useful in simple deplpoyments
#' where there is only one MHN server. In such cases, the easiest way to
#' accomplish this is to set it in the `.Renviron` file in your
#' home directory.
#'
#' @name mhn
#' @docType package
#' @author Bob Rudis (@@hrbrmstr)
#' @import httr jsonlite
NULL
