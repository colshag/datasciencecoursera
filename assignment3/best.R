best <- function(state, outcome){
        # Write a function called best that take two arguments: the 2-character 
        # abbreviated name of a state and an outcome name. The function reads the 
        # outcome-of-care-measures.csv ???le and returns a character vector with the 
        # name of the hospital that has the best (i.e. lowest) 30-day mortality 
        # for the specified outcome in that state. The hospital name is the name 
        # provided in the Hospital.Name variable. The outcomes can be one of 
        # "heart attack", "heart failure", or "pneumonia". 
        # Hospitals that do not have data on a particular outcome should be 
        # excluded from the set of hospitals when deciding the rankings.
        
        ## Read outcome data
        source('as3.R')
        myDF <- getDF(state, outcome)
        
        # sort by the 3rd column which is the mortality rate
        # you have to convert the character column rates to numeric first!
        myDF <- myDF[order(as.numeric(myDF[,3])),]
        
        return(myDF[1,1])
}

## TEST Cases
# > source("best.R") 
# > best("TX", "heart attack")
# [1] "CYPRESS FAIRBANKS MEDICAL CENTER"
# > best("TX", "heart failure")
# [1] "FORT DUNCAN MEDICAL CENTER"
# > best("MD", "heart attack")
# [1] "JOHNS HOPKINS HOSPITAL, THE"
# > best("MD", "pneumonia")
# [1] "GREATER BALTIMORE MEDICAL CENTER"
# > best("BB", "heart attack") 
# Error in best("BB", "heart attack") : invalid state 
# > best("NY", "hert attack") 
# Error in best("NY", "hert attack") : invalid outcome