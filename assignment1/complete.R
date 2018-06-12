complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2 1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
        
        # get data table of just the files specified
        source('as1.R')
        DT <- getMyDT(directory, id)
        
        # remove the null rows
        DT <- DT[complete.cases(DT),]
        
        # make new Data Frame just counting rows per ID
        DF <- data.frame("id" = integer(), "nobs" = integer())
        for (i in id){
                newRow <- data.frame(id = i, nobs = nrow(DT[id == i]) )
                DF <- rbind(DF, newRow)
        }
        return(DF)
}