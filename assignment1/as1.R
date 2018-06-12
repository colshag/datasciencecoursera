loadCSVFiles <- function(subfolderName="/specdata"){
        # load the csv files from specified sub folder into a data table
        library(data.table)
        oldwd = getwd()
        mywd <- paste(oldwd, subfolderName, sep="")
        setwd(mywd)
        files = list.files(pattern="*.csv")
        DT = do.call(rbind, lapply(files, fread))
        setwd(oldwd)
        return(DT)
}

loadCSVFiles()