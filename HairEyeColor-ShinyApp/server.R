library(shiny)
library(markdown)
shinyServer(
  function(input,output){
    source("haireyefunction.R")
    source("haireyebarchart.R")
    gethair<-eventReactive(input$goButton,{input$hair})
    geteye<-eventReactive(input$goButton,{input$eye})
    getsex<-eventReactive(input$goButton,{input$sex})
    output$oplot<-renderPlot({haireyebarchart()})
    output$oprcent<-renderPrint({V1<-haireyepercent(gethair(),geteye(),getsex())[1]
                                 V2<-haireyepercent(gethair(),geteye(),getsex())[2]
                                 cat("Based on above chart, with your", gethair(),"hairs and",geteye()," eyes,you are among ",V1,
                                 " percent of the ","'",getsex(),"'"," population and among",V2,"percent of the whole population!")})
    }
)