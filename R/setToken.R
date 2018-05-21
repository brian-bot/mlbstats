## AUTHOR: BRIAN M. BOT
#####

# setToken <- function(token){
#   stopifnot( length(token)==1L & is.character(token))
#   
#   ## IF PASS CHECK, THEN SET IN CACHE FOR FUTURE CALLS
#   header <- .getMlbstatsCache("httpheader")
#   header[["Authorization"]] <- paste("Bearer", token)
#   getUser <- mlbstatsRestGET("/me.json", httpheader=header)
#   if( "error" %in% names(getUser) ){
#     stop("token not recognized by mlbstats - check the token or generate a new personal access token")
#   }
# 
#   .setMlbstatsCache("Authorization", paste("Bearer", token))
#   
#   message(sprintf("mlbstats API key successfully stored for %s %s", getUser$first_name, getUser$last_name))
#   return(invisible(NULL))
# }

