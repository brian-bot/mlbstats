## REST API CALLS
#####
## FOCUS ON GET CALLS ONLY FOR NOW - POSSIBLY EXTEND TO POST, PATCH, PUT, AND DELETE IN THE FUTURE
#####

mlbstatsRestGET <- function(uri, endpoint = .getMlbstatsCache("mlbstatsEndpoint"), .opts=.getMlbstatsCache("opts"), httpheader=.getMlbstatsCache("httpheader"), ...){
  uri <- sub(endpoint, "", uri, fixed=T)
  if(substr(uri, 1, 1) == "/"){
    uri <- substr(uri, 2, nchar(uri))
  }
  
  url <- paste(endpoint, uri, sep="")
  .getMlbstatsJSON(url, .opts=.opts, httpheader=httpheader, ...)
}

