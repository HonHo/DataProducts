getRpartPlot <- function(percent, modelPicked) {
    set.seed(800)

    # create test/train data sets
    idxTrain <- createDataPartition(y = carsData$classe, p = percent/100, list = FALSE)
    trainData <- carsData[idxTrain,]
    testData <- carsData[-idxTrain,]
    
    rpartPlot <- NULL
    
    if (modelPicked == "rpart") {
        modelFit <- train(classe ~ ., data = trainData, method = "rpart")
        title <- paste0("\nRPart Decision Tree with ", percent, "% of Data Set\n\n\n")
        rpartPlot <- fancyRpartPlot(modelFit$finalModel, main = title, sub = "")
    }
    rpartPlot
}



