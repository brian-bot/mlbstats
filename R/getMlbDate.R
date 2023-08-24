getMlbDate <- function(d){
  # class(d) <- "Date"
  cat("##", as.character(d), "##\n")
  
  ## POOR MANS CHECK TO ENSURE API RATE LIMIT NOT EXCEDED
  # system("sleep 10")
  daysEvents <- mlbstatsRestGET(paste("/schedule?sportId=1&date=", substr(d,6,7), "%2F", substr(d,9,10), "%2F", substr(d,1,4), sep=""))
  
  ## CHECK TO SEE IF THERE ARE ANY GAMES ON THIS DAY
  ne <- daysEvents$totalGames
  if( ne == 0 ){
    return(cat("No games today:", as.character(d), "\n"))
  }
  
  ## BUILD UP A LIST OF BATTERS AND PITCHERS FOR EACH DAY
  allData <- list()
  ## CYCLE THROUGH EACH GAME FOR THIS DAY
  for( i in 1:ne ){
    event <- daysEvents$dates[[1]]$games[[i]]
    
    ## GRAB THE BOXSCORE IF GAME IS COMPLETED
    if( event$status[["statusCode"]] %in% c("F", "O", "UR", "FR") ){
      if( event$gameType == "R" ){
        if( event$gamePk == 530032 & d == "2018-06-18" ){
          cat("THIS IS THE GOOFY EXCEPTION THAT ROSS AND DUANE ARE MAKING ME WORK AROUND")
        } else if( event$gamePk == 531387 & d == "2018-08-29" ){
          cat("THIS IS THE *OTHER* GOOFY EXCEPTION THAT ROSS AND DUANE ARE MAKING ME WORK AROUND")
        } else if( event$gamePk == 565534 & d == "2019-09-06" ){
          cat("THIS IS THE *OTHER* GOOFY EXCEPTION THAT ROSS AND DUANE ARE MAKING ME WORK AROUND")
        } else if( event$gamePk == 567288 & d == "2019-05-28" ){
          cat("THIS IS THE *OTHER* GOOFY EXCEPTION THAT ROSS AND DUANE ARE MAKING ME WORK AROUND")
        } else if( event$gamePk == 565085 & d == "2019-08-22" ){
          cat("THIS IS THE *OTHER* GOOFY EXCEPTION THAT ROSS AND DUANE ARE MAKING ME WORK AROUND")
        } else if( event$gamePk == 634408 & d == "2021-04-21" ){
          cat("THIS IS THE *OTHER* GOOFY EXCEPTION THAT ROSS AND DUANE ARE MAKING ME WORK AROUND")
        } else if( event$gamePk == 633890 & d == "2021-05-27" ){
          cat("THIS IS THE *OTHER* GOOFY EXCEPTION THAT ROSS AND DUANE ARE MAKING ME WORK AROUND")
        } else if( event$gamePk == 633501 & d == "2021-06-27" ){
          cat("THIS IS THE *OTHER* GOOFY EXCEPTION THAT ROSS AND DUANE ARE MAKING ME WORK AROUND")
        } else if( event$gamePk == 633267 & d == "2021-07-18" ){
          cat("THIS IS THE *OTHER* GOOFY EXCEPTION THAT ROSS AND DUANE ARE MAKING ME WORK AROUND")
        } else if( event$gamePk == 633299 & d == "2021-07-18" ){
          cat("THIS IS THE *OTHER* GOOFY EXCEPTION THAT ROSS AND DUANE ARE MAKING ME WORK AROUND")
        } else if( event$gamePk == 633224 & d == "2021-09-24" ){
          cat("THIS IS THE *OTHER* GOOFY EXCEPTION THAT ROSS AND DUANE ARE MAKING ME WORK AROUND")
        } else if( event$gamePk == 632966 & d == "2021-08-11" ){
          cat("THIS IS THE *OTHER* GOOFY EXCEPTION THAT ROSS AND DUANE ARE MAKING ME WORK AROUND")
        } else if( event$gamePk == 661702 & d == "2022-05-12" ){
          cat("THIS IS THE *OTHER* GOOFY EXCEPTION THAT ROSS AND DUANE ARE MAKING ME WORK AROUND")
        } else if( event$gamePk == 718203 & d == "2023-05-14" ){
          cat("THIS IS THE *OTHER* GOOFY EXCEPTION THAT ROSS AND DUANE ARE MAKING ME WORK AROUND")
        } else if( event$gamePk == 717407 & d == "2023-07-15" ){
          cat("THIS IS THE *OTHER* GOOFY EXCEPTION THAT ROSS AND DUANE ARE MAKING ME WORK AROUND")
        } else if( event$gamePk == 717375 & d == "2023-07-18" ){
          cat("THIS IS THE *OTHER* GOOFY EXCEPTION THAT ROSS AND DUANE ARE MAKING ME WORK AROUND")
        } else if( event$gamePk == 717324 & d == "2023-07-22" ){
          cat("THIS IS THE *OTHER* GOOFY EXCEPTION THAT ROSS AND DUANE ARE MAKING ME WORK AROUND")
        } else if( event$gamePk == 716875 & d == "2023-08-24" ){
          cat("THIS IS THE *OTHER* GOOFY EXCEPTION THAT ROSS AND DUANE ARE MAKING ME WORK AROUND")
        } else{
          allData[[i]] <- getMlbEvent(event$gamePk)
        }716875
      }
    } else{
      ## IF THE GAME IS NOT COMPLETED - JUST PRINT A MESSAGE
      cat("Event", event$gamePk, "was not complete:", event$status[["statusCode"]], "\n")
    }
  }
  ## COMBINE MATRICES FOR EACH DAYS BATTERS AND PITCHERS
  allBatters <- bind_rows(lapply(allData, "[[", "batters"))
  allPitchers <- bind_rows(lapply(allData, "[[", "pitchers"))
  
  return(list(batters=allBatters, pitchers=allPitchers))
}
