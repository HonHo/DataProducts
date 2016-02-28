getMatrix <- function(percent, modelPicked) {

    gbmFile <- NULL

    # If matrix file for gbm exists on server, use it.  Otherwise, creates one.
    if (modelPicked == "gbm") {
        gbmFile <- paste0("data/gbm_", percent, ".rds")
        
        if (file.exists(gbmFile)) {
            confMatrix <- readRDS(gbmFile)
            return(confMatrix)
        }
    }

    set.seed(800)
    
    # create test/train data sets
    idxTrain <- getIdxTrain(percent)
    trainData <- getTrainData(idxTrain)
    testData <- getTestData(idxTrain)
    
    if (modelPicked == "rf") {
        modelFit <- randomForest(classe ~ ., data = trainData)
    } else if (modelPicked == "gbm") {
        modelFit <- train(classe ~ ., data = trainData, method = modelPicked, verbose = FALSE)
    } else {    # rpart or lda
        modelFit <- train(classe ~ ., data = trainData, method = modelPicked)
    }
    
    predict <- predict(modelFit, newdata = testData)
    confMatrix <- confusionMatrix(testData$classe, predict)
    
    if (modelPicked == "gbm") {
        saveRDS(confMatrix, gbmFile)
    }
    
    return(confMatrix)
}





