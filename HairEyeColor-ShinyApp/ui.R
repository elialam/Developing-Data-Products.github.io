library(shiny)
shinyUI(
   navbarPage("Hair-Eye Color Distribution Explorer",
               tabPanel("How Rare You Are?!",                
                         sidebarPanel(
                               selectInput('hair','What is your hair color?',c("","Black","Brown","Red","Blond"),selected = NULL,multiple= FALSE,selectize=FALSE),
                               selectInput('eye','What is your eye color?',c("","Blue","Brown","Hazel","Green"),multiple=FALSE,selectize=FALSE),
                               radioButtons('sex','What is your gender?',c("Female","Male"),selected = NULL,inline = TRUE),
                               actionButton("goButton","Go!") 
                                     ),
                         mainPanel(
                               plotOutput("oplot"),
                               h3(textOutput("oprcent"))
                                  )
                        ),
              
               tabPanel("About This App",
                        mainPanel(includeMarkdown("AppDoc.md"))
                      )
          )

       )
  
    