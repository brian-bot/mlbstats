## Startup functions and global constants
###############################################################################

kCertBundle <- "certificateBundle/cacert.pem"

.onLoad <- function(libname, pkgname){
  
  ## SET ESPN CACHE AND START OPTIONS
  .setMlbstatsCache("opts", list())
  .setMlbstatsCache("mlbstatsEndpoint", "http://statsapi.mlb.com:80/api/v1/")
  .setMlbstatsCache("httpheader", character())
  .setMlbstatsCache("User-Agent", .userAgent())
  .setMlbstatsCache("low.speed.time", 60)
  .setMlbstatsCache("low.speed.limit", 1)
  .setMlbstatsCache("connecttimeout", 300)
  .setMlbstatsCache("followlocation", TRUE)
  .setMlbstatsCache("verbose", FALSE)
  .setMlbstatsCache("cainfo", file.path(libname, pkgname, kCertBundle))
}

.userAgent <- function(){
#   return(paste("mlbstats/", utils::packageDescription("mlbstats", fields="Version"), sep=""))
  return(paste("mlbstats/", utils::packageDescription("mlbstats", fields="Version"), "(http://www.github.com/brian-bot/mlbstats)", sep=""))
}
