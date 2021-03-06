library(shiny)

shinyUI(fluidPage(
  
  # Application title
  titlePanel("BMI Calculator"),
  
  # Sidebar with input objects
  tabsetPanel(tabPanel("Main",
  sidebarLayout(
    sidebarPanel(
      sliderInput(inputId="feet",
                  "Height in feet:",
                  min = 3,
                  max = 7,
                  value = 0),
      
      sliderInput("inches",
                  "Height inches:",
                  min = 0,
                  max = 12,
                  value = 0),
      
      numericInput("pounds",
                   "Weight in pounds:",
                   min = 0,
                   max = 300,
                   value = 0),
      actionButton("goButton", "Calculate!")
      
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      ('Height:'), textOutput('ht'),
      ('Weight:'), textOutput('wt'),
      plotOutput("distPlot"),
      tags$a(href = "~Read_Me.Rmd", "Click here to learn more about this app")
      
      
      
      
    )
  )
  ),
  tabPanel("About BMI Calc", includeHTML("Read_Me.html"))
  )
))
