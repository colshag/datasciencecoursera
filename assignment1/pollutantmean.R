library(data.table)

pollutantmean <- function(directory, pollutant, id = 1:332){
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
        ## NOTE: Do not round the result:
        
        # create a vector of just the files we want to read
        myFiles = list.files(directory)
        newFiles = c() # empty vector
        j <- 1
        for (i in id){
                newFiles[j] <- myFiles[i]
                j <- j + 1
        }
        
        # read this vector into a data table
        setwd(directory)
        DT = do.call(rbind, lapply(newFiles, fread))
        setwd("..")
        
        # return the mean
        return(mean( DT[,get(pollutant)], na.rm = TRUE))
}
