# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyServer(function(input, output) {
  htInches<-reactive({as.numeric(input$feet)*12 + input$inches})
  wtPounds<-reactive({as.numeric(input$pounds)})
  
  output$ht<-renderText(paste(htInches(), "Inches"))
  output$wt<-renderText(paste(wtPounds(), "Pounds"))
  
  output$distPlot <- renderPlot({
    input$goButton
    bmi<- reactive({as.numeric(isolate(input$pounds)/(input$feet*12 + input$inches)^2)*703.06957964})
    bmitxt<-reactive(paste("BMI=",round(bmi(),0)))
    y<-reactive(matrix(nrow=2,ncol=1,c(bmi(),30)))
    #cc<-ifelse(bmi() < 25, "green", ifelse(bmi() <30, "yellow", "red"))
    paste(l<-barplot(y(), col=c(ifelse(bmi() < 25, "green", ifelse(bmi() <30, "yellow", "red")),"grey")), 
          k<-text(l, bmi()+4, format(bmitxt()),xpd=TRUE, col="blue", cex=2))
   
      
  })   
    
})
