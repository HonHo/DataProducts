library(shiny)
library(markdown)

shinyUI(
    navbarPage("Predictive Model Exploration Tool",
        tabPanel("Model Exploration",
            sidebarPanel(
                h5("To explore the confusion matrix and statistics of each of the models below, please:"),
                h5("    1. select one of the predictive models"),
                h5("    2. select percentage of sample data set as training data set"),
                radioButtons("predModel", label = "Predictive Models:",
                             choices = list(
                             "gbm (Generalized Boosted Models)" = "gbm",
                             "lda (Linear Discriminant Analysis)" = "lda",
                             "rf (Random Forest)" = "rf",
                             "rpart (Recursive Partitioning)" = "rpart"
                             ), selected = "gbm"
                             ),
                sliderInput("percentTrain", label = "Percentage of Sample Data Set as Training Data Set:", 
                            min = 60, max = 90, value = 80, step = 1
                            )
                ),
            mainPanel(
                tabsetPanel(
                    tabPanel(p(icon("bars"), "Statistics"), 
                             h5(strong(textOutput("matrixTitle"), align = "center")),
                             verbatimTextOutput("stats")
                             # only for RPart plot
                             # Needs rattle lib which is not supported by shinyapp.io!
                             # plotOutput("rpartPlot") 
                             ),
                    tabPanel(p(icon("table"), "Dataset"), 
                             h5(strong(textOutput("trainDS"), align = "center")),
                             dataTableOutput("dataTbl")
                             ),
                    tabPanel(p(icon("line-chart"), "Plot"), plotOutput("plot"))
                    )
                )
            ), # end of "Model Exploration" tab panel
        tabPanel("About",
            mainPanel(
                includeMarkdown("about.md")
            ) # end of "About" tab panel
        )
    )
)