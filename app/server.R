library(shiny)

# Load and pre-process the data file
source("dataProcessor.R", local = TRUE)

shinyServer(
    function(input, output) {

        # Percent of training data in decimal
        #         p <- reactive({  
        #             input$percentTrain / 100
        #         })
        
        # Title of "Confusion Matrix and Statistics" section
        output$matrixTitle <- renderText({
            sprintf("Confusion Matrix and Statistics of %s%% Data Set and \"%s\" Model", input$percentTrain, input$predModel)
        })
        
        # "Confusion Matrix and Statistics" section
        output$stats <- renderPrint({
            source("confMatrix.R", local = TRUE)

            getMatrix(input$percentTrain, input$predModel)
        })

        # Fancy RPart Plot
        # Needs rattle lib which is not supported by shinyapp.io!
        # output$rpartPlot <- renderPlot({
        #     source("rpartPlot.R", local = TRUE)
        #     
        #     getRpartPlot(input$percentTrain, input$predModel)
        # })
        
        # Title of training dataset
        output$trainDS <- renderText({
            sprintf("Training Data Set with %s%% of Sample Data Set", input$percentTrain)
        })
        
        # Render dataset
        output$dataTbl <- renderDataTable({
            idxTrain <- getIdxTrain(input$percentTrain)
            trainData <- getTrainData(idxTrain)
            trainData
        })
        
        # Plot dataset
        output$plot <- renderPlot({
            getAccuracyPlot(input$percentTrain)
        })
    }
)