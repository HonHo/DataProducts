library(lattice)
library(ggplot2)
library(caret)
#library(rattle) # Not supported by shinyapp.io!
library(e1071)
library(randomForest)
library(MASS)
library(survival)
library(splines)
library(parallel)
library(gbm)
library(plyr)
library(rpart)
library(reshape2)

accuDataFile <- "./data/accuracies.data"
accuData <- read.table(accuDataFile, header = TRUE, sep = ",")

accuDataMelt <- melt(accuData, id = "percent")
names(accuDataMelt)[2:3] <- c("model", "accuracy")

cNames <- c("buying", "maint", "doors", "persons", "lug_boot", "safety", "classe")
carsDataFile <- "./data/car.data"

carsData <- read.table(carsDataFile, header = FALSE, sep = ",", col.names = cNames)

carsData$buying <- ordered(carsData$buying, levels = c("low", "med", "high", "vhigh"))
carsData$maint <- ordered(carsData$maint, levels = c("low", "med", "high", "vhigh"))
carsData$doors <- ordered(carsData$doors, levels = c("2", "3", "4", "5more"))
carsData$persons <- ordered(carsData$persons, levels = c("2", "4", "more"))
carsData$lug_boot <- ordered(carsData$lug_boot, levels = c("small", "med", "big"))
carsData$safety <- ordered(carsData$safety, levels = c("low", "med", "high"))

# Get cars data
getCarsData <- function() {
    carsData
}

# Get accuracy data
getAccuData <- function() {
    accuData
}

# Get melted accuracy data
getAccuDataMelt <- function() {
    accuDataMelt
}

getIdxTrain <- function(percent) {
    idxTrain <- createDataPartition(y = carsData$classe, p = percent/100, list = FALSE)
    idxTrain
}

getTrainData <- function(idxTrain) {
    trainData <- carsData[idxTrain,]
    trainData
}

getTestData <- function(idxTrain) {
    testData <- carsData[-idxTrain,]
    testData
}

# Plot charts of percents of training data used vs. accuracies
getAccuracyPlot <- function(inPercent) {
    g <- ggplot(accuDataMelt, aes(percent, accuracy, group = model, colour = model)) +
        geom_line(size = 1) + geom_point(size = 3.5) + theme_bw() + 
        geom_vline(aes(xintercept = inPercent), color = "blue", size = 0.6) +
        labs(title = "Training Data Size vs. Accuracy") +
        labs(x = "Training Data Size in Percentage of Sample Data Set") + 
        labs(y = "Accuracy in Percentage")
    g
}



