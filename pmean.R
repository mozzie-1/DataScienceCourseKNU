> pmean <- function(directory, pollutant, id=1:332){
     allfiles <- list.files(path=directory, pattern=".csv", full.names=TRUE)
     nodata <- numeric()
     
     for (i in id){
         data <- read.csv(allfiles[i])
         nodata <- c(nodata, data[[pollutant]])
     }
     
     mean(nodata, na.rm = TRUE)
 }



> complete <- function(directory, id=1:332){
     allfiles <- list.files(path=directory, pattern=".csv", full.names=TRUE)
     nodata <- numeric()
     
     for (i in id){
        data <- read.csv(allfiles[i])
         nodata <- c(nodata, sum(complete.cases(data)))
     }
     
     data.frame(id, nodata)
 }



corr <- function(directory, threshold = 0) {
    id = 1:332
    filename <- list.files(directory, full.names = TRUE)
    
    result <-vector("numeric", length=0)
    
    for(i in seq(filename)) {
        airquality <- read.csv(filename[i])
        good <- complete.cases(airquality)
        airquality <- airquality[good, ]
        if (nrow(airquality) > threshold) {
            
            correlation <- cor(airquality[["sulfate"]], airquality[["nitrate"]])
            result <- append(result, correlation)
            
        }
    }
    result
}
