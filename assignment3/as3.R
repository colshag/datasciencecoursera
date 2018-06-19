## Assignment 3 - Chris Lewis ##

getDF <- function(state, outcome){
        # return a DF based by cleaning up data sorting by state and outcome
        ## Read outcome data
        DF <- read.csv('outcome-of-care-measures.csv', colClasses = 'character', na.strings = 'Not Available', stringsAsFactors = FALSE)
        
        # grab a unique list of all state names specified in data
        stateDF <- DF[, 7]
        stateAbb <- unique(stateDF)
        
        ## Check that state and outcome are valid
        outcomes <- c('heart attack'=11, 'heart failure'=17, 'pneumonia'=23)
        if (!(is.element(state, stateAbb)) ){
                stop('invalid state')
        }else if(is.na(outcomes[outcome])){
                stop('invalid outcome')
        }
        
        ## Return hospital name in that state with lowest 30-day death rate
        # [2] is hospital name, [7] is the state abbr, outcomes[outcome] is chosen metric->make a smaller data table
        myDF <- DF[, c(2,7,outcomes[outcome])]
        
        # remove NAs
        myDF <- myDF[complete.cases(myDF), ]
        
        # take out all states but the one specified
        myDF <- myDF[which(myDF$State == state),]
}
