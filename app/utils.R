
source("dataProcessor.R")
source("confMatrix.R")

writeAccuracyTbl <- function() {
    
    totRows <- NULL
    
    for(i in 60:90) {
        confMatrix <- getMatrix(i, "gbm")
        saveRDS(confMatrix, paste0("data/gbm_", i, ".rds"))
        gbm <- round(confMatrix$overall[[1]], 4) * 100
        
        confMatrix <- getMatrix(i, "lda")
        lda <- round(confMatrix$overall[[1]], 4) * 100
        
        confMatrix <- getMatrix(i, "rf")
        rf <- round(confMatrix$overall[[1]], 4) * 100
        
        confMatrix <- getMatrix(i, "rpart")
        rpart <- round(confMatrix$overall[[1]], 4) * 100
        
        totRows <- rbind(totRows, c(percent = i, gbm = gbm, lda = lda, rf = rf, rpart = rpart))
    }
    
    outTbl <- as.data.frame(totRows, check.names = FALSE)
    write.table(outTbl, file = "data/accuracies.data", row.names = FALSE, quote = FALSE, sep = ",")
}