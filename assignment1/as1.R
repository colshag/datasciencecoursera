library(data.table)

getMyDT <- function(directory, id = 1:332) {
        ## Read a subdirectory name where data files in csv format are located
        ## Return a Data Table of just the files that are specified
        
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
        return(DT)
}
