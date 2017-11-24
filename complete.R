complete <- function(directory, id = 1:332) {
        setwd(paste(getwd(), "/", directory, sep = ""))
        # list all files in the directory dir()
        filename <- dir()
        #Load all files as a list
        
        filelist <- lapply(filename, read.csv)
        
        res <- data.frame()
        
        for (i in id) {
                
                x <- data.frame(filelist[[i]])
                g <- complete.cases(x)
                x <- x[g, ]
                nobs <- length(x[,1])
                y <- data.frame("id" = i, "nobs" = nobs)
                res <- rbind(res, y)
                
        }
        
        res[complete.cases(res), ]
}

