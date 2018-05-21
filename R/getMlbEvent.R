getMlbEvent <- function(eventId){
  boxscore <- mlbstatsRestGET(paste("game/", eventId, "/boxscore", sep=""))
  cat("  retrieved game:", eventId, "\n")
  
  ## BATTERS
  ## HOME
  hbId <- boxscore$teams$home$batters
  hbAll <- sapply(boxscore$teams$home$players, function(x){
    if(x$person$id %in% hbId){
      tmp <- c(id=x$person$id, fullName=x$person$fullName, unlist(x$stats$batting))
      return(data.frame(as.list(tmp), stringsAsFactors=FALSE))
    } else{
      return(NULL)
    }
  })
  hbAll[sapply(hbAll, is.null)] <- NULL
  hb <- bind_rows(hbAll)
  ## AWAY
  abId <- boxscore$teams$away$batters
  abAll <- sapply(boxscore$teams$away$players, function(x){
    if(x$person$id %in% abId){
      tmp <- c(id=x$person$id, fullName=x$person$fullName, unlist(x$stats$batting))
      return(data.frame(as.list(tmp), stringsAsFactors=FALSE))
    } else{
      return(NULL)
    }
  })
  abAll[sapply(abAll, is.null)] <- NULL
  ab <- bind_rows(abAll)
  ## ALL TOGETHER
  allBatters <- bind_rows(hb, ab)
  
  ## PITCHERS
  ## HOME
  hpId <- boxscore$teams$home$pitchers
  hpAll <- sapply(boxscore$teams$home$players, function(x){
    if(x$person$id %in% hpId){
      tmp <- c(id=x$person$id, fullName=x$person$fullName, unlist(x$stats$pitching))
      return(data.frame(as.list(tmp), stringsAsFactors=FALSE))
    } else{
      return(NULL)
    }
  })
  hpAll[sapply(hpAll, is.null)] <- NULL
  hp <- bind_rows(hpAll)
  ## AWAY
  apId <- boxscore$teams$away$pitchers
  apAll <- sapply(boxscore$teams$away$players, function(x){
    if(x$person$id %in% apId){
      tmp <- c(id=x$person$id, fullName=x$person$fullName, unlist(x$stats$pitching))
      return(data.frame(as.list(tmp), stringsAsFactors=FALSE))
    } else{
      return(NULL)
    }
  })
  apAll[sapply(apAll, is.null)] <- NULL
  ap <- bind_rows(apAll)
  ## ALL TOGETHER
  allPitchers <- bind_rows(hp, ap)
  
  return(list(batters=allBatters, pitchers=allPitchers))
}
