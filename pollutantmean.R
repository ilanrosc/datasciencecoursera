pollutantmean <- function(directory, pollutant, id = 1:332) {
        setwd(paste(getwd(), "/", directory, sep = ""))
        # list all files in the directory dir()
        filename <- dir()
        #Load all files as a list
        
        filelist <- lapply(filename, read.csv)
        
        y <- data.frame()
        
        for (i in id) {
                
                x <- if (pollutant == "sulfate") {filelist[[i]][2]} else filelist[[i]][3]
                
                # x <- filelist[[1]][2]
                x1 <- data.frame(x, check.names = FALSE)
                y <- rbind(y,x1, deparse.level = 0)
                
        }
        
        bad <- is.na(y[1])
        mean(y[!bad])
}
