

library(shiny)

# Define UI for application 
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Prediction of Diamond Price"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput("mass",
                   "Mass in Carat:",
                   min = 0.1,
                   max = 0.35,
                   value = 0.2)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("lmPlot"),
       br(),
       h1("PREDICTION"),
       textOutput("prediction"),
       tags$head(tags$style("#prediction{color: blue;
                                 font-size: 20px;
                            font-style: italic;
                            }"
       )),
       br(),
       h1("DOCUMENTATION"),
       textOutput("documentation"),
       tags$head(tags$style("#documentation{color: red;
                                 font-size: 20px;
                            font-style: italic;
                            }"
                         )
       )
    )
  )
))
