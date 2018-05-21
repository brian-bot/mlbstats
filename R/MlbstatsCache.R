## CREATE AND MANAGE A GLOBAL CACHE FOR THE CLIENT TO ACCESS
#####
## AUTHOR: BRIAN M. BOT
#####

.setMlbstatsCache <- function(key, value){
  cache <- new("MlbstatsCache")
  cache@env[[key]] <- value
  
  ## IF ONE OF THESE PARAMS THEN ADD TO opts
  validOpts <- c("low.speed.time", "low.speed.limit", "connecttimeout", "followlocation", "verbose")
  if(key %in% validOpts){
    opts <- .getMlbstatsCache("opts")
    opts[[key]] <- value
    .setMlbstatsCache("opts", opts)
  }
  
  ## IF ONE OF THESE PARAMS THEN ADD TO httpheader
  validHeaders <- c("Authorization", "User-Agent", "Accept")
  if(key %in% validHeaders){
    httpheader <- .getMlbstatsCache("httpheader")
    httpheader[[key]] <- value
    .setMlbstatsCache("httpheader", httpheader)
  }
  
  return(NULL)
}

.inMlbstatsCache <- function(key){
  cache <- new("MlbstatsCache")
  return(key %in% ls(cache@env))
}

.getMlbstatsCache <- function(key){
  if( !.inMlbstatsCache(key) ){
    return(NULL)
  } else{
    cache <- new("MlbstatsCache")
    return(cache@env[[key]])
  }
}

