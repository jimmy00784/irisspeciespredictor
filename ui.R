
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Iris Species Predictor"),
  
  tabsetPanel(
    tabPanel("Home",
       fluidPage(
         h3("Getting Started"),
         div("Documentation here")
       )
    ),
    tabPanel("Predictor",
      br(),
      sidebarLayout(
        sidebarPanel(
          numericInput("petal.length","Enter Petal Length in cm",min=1,value=1),
          numericInput("petal.width","Enter Petal Width in cm",min=0.1,value=0.1),
          fluidRow(
            column(4,actionButton("goButton","Predict")),
            column(8,checkboxInput("showModel","Show Tree"))
          )
        ),
    
        # Show a plot of the generated distribution
        mainPanel(
          h3("User Inputs"),
          column(4,"Petal Length (cm): "),column(4,strong(textOutput("petal.length",inline=TRUE))),br(),
          column(4,"Petal Width (cm): "),column(4,strong(textOutput("petal.width",inline=TRUE))),br(),
          h3("Prediction"),
          column(4,"Species: "),column(4,em(strong(textOutput("predicted.species", inline = TRUE)))),br(),br(),
          div(htmlOutput("finalModel"))
        )
      )
    )
  ),
  div(em("Programmer: Karim Lalani"))
))
