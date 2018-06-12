corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length i indicating
        ## the location of the CSV files
        
        ## 'threshold' is a  numeric vector of length i indicating the
        ## number of completely observed observations (on all variables)
        ## required to compute the correlation between nitrate and
        ## sulfate; the default is 0 (which means only use an observed csv
        ## file of cases if the sum of those completed cases is greater than
        ## the threshold)
        
        ## Return a numeric vector of correlations on the summary of cases
        ## NOTE: Do not round the result.
        
        source("as1.R")
        ##myFiles <- list.files(directory)
        myVec = c()
        myOutput = c()
        
        for (i in 1:332){
                DT <- getMyDT(directory, i)
                # remove the null rows
                DT <- DT[complete.cases(DT),]
                
                # only calculate cor() on files that have threshold cases inputed
                if (nrow(DT) > threshold) {
                        myVec <- cor(DT[["sulfate"]], DT[["nitrate"]], use = "complete.obs")
                        myOutput <- c(myOutput, myVec)
                }
                
        }
        
        return(myOutput)
        
}
