
library(UsingR)
library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  
  prediction <- reactive ({
    data(diamond)
    fit <- lm(price ~ carat-1, data = diamond)
    pred <- predict(fit, data.frame(carat = input$mass))
    list1 <- list("fit"=fit, "pred"=pred)
    return(list1)
    
  })
  
  output$lmPlot <- renderPlot({
    
    xcarat <- input$mass
    # plot the data points
    plot(diamond$carat, diamond$price, xlab = "Mass (carats)", ylab = "Price (SIN $)",bg = "lightblue", col = "black", cex = 2, pch = 21)
    # plot linear regression line
    abline(prediction()$fit, lwd = 2)
    # plot predictions for every value of carat (in red)
    points(diamond$carat, predict(prediction()$fit), cex = 2, pch = 19, col = "red")
    # plot predictions for for the mass of input$carat
    points(xcarat, prediction()$pred, cex = 4, pch = 19, col = "black")
    
  })
  
  output$prediction <- renderText({
    
    paste("The predicted price for the selected diamond mass of", input$mass, "carat is:", round(prediction()$pred,2), "$", sep=" ")
    
  })
  
  output$documentation <- renderText({
    
    "This Shiny application aims at predicting the diamond price according to the mass in carat. 
    
    The linear regression model is used for the training based on the data diamond from the package UsingR. 
    
    You can choose different mass on the left side, the price will be displayed on the right side in the graphic (black point)."
    
  })
  
})
