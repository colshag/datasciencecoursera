## Assignment 3 - Chris Lewis
#

best <- function(state, outcome){
        #Write a function called best that take two arguments: the 2-character 
        #abbreviated name of a state and an outcome name. The function reads the 
        #outcome-of-care-measures.csv ???le and returns a character vector with the 
        #name of the hospital that has the best (i.e. lowest) 30-day mortality 
        #for the speci???ed outcome in that state. The hospital name is the name 
        #provided in the Hospital.Name variable. The outcomes can be one of 
        #"heart attack", "heart failure", or "pneumonia". 
        #Hospitals that do not have data on a particular outcome should be 
        #excluded from the set of hospitals when deciding the rankings.
        
        ## Read outcome data
        DF <- read.csv('outcome-of-care-measures.csv', colClasses = 'character', na.strings = 'Not Available', stringsAsFactors = FALSE)
        
        ## Check that state and outcome are valid
        outcomes <- c('heart attack'=11, 'heart failure'=17, 'pneumonia'=23)
        if (!(is.element(state, state.abb)) ){
                stop('invalid state')
        }else if(is.na(outcomes[outcome])){
                stop('invalid outcome')
        }
        
        ## Return hospital name in that state with lowest 30-day death rate
        #[2] is hospital name, [7] is the state abbr, make a smaller data table
        myDF <- DF[, c(2,7,outcomes[outcome])]
        myDF <- myDF[complete.cases(myDF), ]
        
        # take out all states but the one specified
        myDF <- myDF[which(myDF$State == state),]
        
        # sort by the 3rd column which is the mortality rate
        # you have to convert the character column rates to numeric first!
        myDF <- myDF[order(as.numeric(myDF[,3])),]
        
        return(myDF[1,1])
        
        ##TEST Cases
        #> source("best.R") 
        #> best("TX", "heart attack")
        #[1] "CYPRESS FAIRBANKS MEDICAL CENTER"
        #> best("TX", "heart failure")
        #[1] "FORT DUNCAN MEDICAL CENTER"
        #> best("MD", "heart attack")
        #[1] "JOHNS HOPKINS HOSPITAL, THE"
        #> best("MD", "pneumonia")
        #[1] "GREATER BALTIMORE MEDICAL CENTER"
        #> best("BB", "heart attack") 
        #Error in best("BB", "heart attack") : invalid state 
        #> best("NY", "hert attack") 
        #Error in best("NY", "hert attack") : invalid outcome
}

rankhospital <- function(state, outcome, num = "best") { 
        
        
        ## Read outcome data
        
        
        ## Check that state and outcome are valid
        
        
        ## Return hospital name in that state with the given rank ## 30-day death rate
        
        #At that point, all you have to do is take a state subset and use 
        #an index to get best, worst, or a particular rank. 
        #For best you'd use 1 for the index, 
        #for worst you'd use nrow(your_subset) 
        #and for just num you'd use that num.
}