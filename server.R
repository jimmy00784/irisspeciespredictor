
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(caret)
load("data/model.RData")
outcomes <- model$finalModel$obsLevels

shinyServer(function(input, output) {
  output$predicted.species = renderText({
    input$goButton
    
    species <- isolate(predict(model,newdata = data.frame(
      Petal.Length = input$petal.length,
      Petal.Width = input$petal.width)
      ))
    outcomes[species]
  })
  output$petal.length = renderText({
    input$goButton
    isolate(input$petal.length)
    })
  output$petal.width = renderText({
    input$goButton
    isolate(input$petal.width)
    })
  output$finalModel = renderText({
    if(input$showModel)
    {
      dectree <- capture.output(model$finalModel)[-(1:5)]
      dectree <- c("<h4><em>Decision Tree:</em></h4>",dectree)
      formatted <- paste(gsub(" ","&nbsp;&nbsp;",dectree),collapse="<br/>")
      formatted
    }
  })

})
