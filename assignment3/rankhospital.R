rankhospital <- function(state, outcome, num = "best") { 
        # take the state abbreviation, outcome, and a ranking for a hospital
        # in that state for the outcome. Return a character vector with the
        # name of the hospital specified by the ranking
        # rankhospital("MD", "heart failure", 5)
        # would return the 5th lowest 30-day death rate for heart failure
        # ties are handled by alphabetical order of the names of hospitals
        
        ## Read outcome data
        source('as3.R')
        myDF <- getDF(state, outcome)
        
        ## Return hospital name in that state with the given rank ## 30-day death rate
        # sort by the 3rd column which is the mortality rate, 
        # then by the alphanumeric hospital name
        myDF <- myDF[order(as.numeric(myDF[,3]), myDF[,1]),]
        
        if (num == "best"){ # For best you'd use 1 for the index
                return(myDF[1,1])
                
        }else if (num == "worst"){ # for worst you'd use nrow(your_subset)
                return(myDF[nrow(myDF),1])
                
        }else{ # and for just num you'd use that num
                return(myDF[num,1])
                
        }
}

## TEST CASES
# > rankhospital("TX", "heart failure", 4)
# [1] "DETAR HOSPITAL NAVARRO"
# > rankhospital("MD", "heart attack", "worst")
# [1] "HARFORD MEMORIAL HOSPITAL"
# > rankhospital("MN", "heart attack", 5000)
# [1] NA