corr <- function(directory, threshold = 0) {
        
        source("complete.R")
        
        #complete <- function(directory, id = 1:332) {
        #        setwd(paste(getwd(), "/", directory, sep = ""))
        #        filename <- dir()
        #        filelist <- lapply(filename, read.csv)
        #        res <- data.frame()
        #        
        #        for (i in id) {
        #                
        #                x <- data.frame(filelist[[i]])
        #                g <- complete.cases(x)
        #                x <- x[g, ]
        #                nobs <- length(x[,1])
        #                y <- data.frame("id" = i, "nobs" = nobs)
        #                res <- rbind(res, y)
        #        }
        #        res[complete.cases(res), ]
        #}
        
        
        allComplete <- complete(directory)
        overThreshold <- allComplete[allComplete$nobs > threshold,1]
        filename <- dir()
        corl <- rep(NA, length(overThreshold))
        
        for (i in overThreshold) {
                data <- read.csv(filename[i])
                sulfateData <- data[complete.cases(data),2]
                nitrateData <- data[complete.cases(data),3]
                corl[i] <- cor(sulfateData, nitrateData)
        }
        
        corl[complete.cases(corl)]        
        
}