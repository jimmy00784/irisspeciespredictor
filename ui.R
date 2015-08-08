
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
         h4("Overview"),
         div(
           "Welcome to the Iris Species Predictor Home created for ",
           em(a("Developing Data Products",href="https://www.coursera.org/course/devdataprod")), 
           " course of the ", 
           a(em("Data Science Specialization"),href="https://www.coursera.org/specialization/jhudatascience/1"), 
           " offered on ", a(em("Coursera"),href="https://www.coursera.org"),"."),
         div("This walkthrough will get you started on using the predictor."),
         h4("Using the Predictor"),
         
         p("You can access the predictor by clicking on the ", strong(em("Predictor")), " tab."),
         
         p("On the left sidebar of the page, you will then be asked to enter values in centimeters for ", em("Petal Length"), " and ", em("Petal Width"), " for the particular iris species that you are interested in."),
         
         p("Once you've provided the values, you should click the ", strong(em("Predict")), " button to see the prediction."),
         
         p("Your results will be shown on the right side Main Panel of the page. You will be able to verify your inputs under ", strong(em("User Inputs")), " and see the species prediction under ", strong(em("Prediction")), "."),
         
         p("If you are interested in seeing the decision tree, you can check the ", strong(em("Show Tree")), " checkbox in the left sidebar."),
         
         h4("Source code"),
         
         p("The source code is hosted on github at ", a("https://github.com/jimmy00784/irisspeciespredictor",href="https://github.com/jimmy00784/irisspeciespredictor"),"."),
         
         p("If you are interested in seeing the code for how the model was fit, it can be found under ", a("model/buildMode.R",href="https://github.com/jimmy00784/irisspeciespredictor/blob/master/model/buildModel.R"), "."),
         
         p("The cached model is stored under ", strong("data/model.RData"), ", and the cached iris dataset itself can be found under ", strong("data/iris.RData"), ".")
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
  br(),
  div(em("Programmer: Karim Lalani"))
))
