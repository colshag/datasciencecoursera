rankall <- function(outcome, num = "best") { 
        # return a 2 column data frame containing the hospital in each state
        # that has the ranking specified in num (best, worst, or num)
        
        source('rankhospital.R')
        myVec = c()
        myOutput = c()
        DF <- data.frame("hospital" = character(), "state" = character())
        
        # grab a unique list of all state names specified in data
        stateDF <- read.csv('outcome-of-care-measures.csv', colClasses = 'character', na.strings = 'Not Available', stringsAsFactors = FALSE)
        stateDF <- stateDF[, 7]
        stateAbb <- unique(stateDF)
        
        ## For each state, find the hospital of the given rank
        for (abb in stateAbb){
                hospitalName <- rankhospital(abb, outcome, num)
                newRow <- data.frame(row.names = abb, hospital = hospitalName, state = abb )
                DF <- rbind(DF, newRow)
        }
        
        ## sort DF by its row names
        DF <- DF[order(row.names(DF)),]
        ## Return a data frame with the hospital names and the ## (abbreviated) state name
        return (DF)
        
}