library(shinydashboard)
library(leaflet)
library(rintrojs)

header <- dashboardHeader(title = "Asian Food in Berlin")
body <- dashboardBody(
    fluidRow(
        tags$style(type="text/css",
                   ".shiny-output-error { visibility: hidden; }",
                   ".shiny-output-error:before { visibility: hidden; }"
        ),
        introjsUI(),
      
        
        introBox(box(width = 10, leafletOutput("map", height = 600)),
                 data.step = 3, 
                 data.intro = "Check out the address",
                 data.position = "right"
                 ),
        column(width = 2,
               introBox( 
                   box(width = NULL,selectInput("type", label = "Type of Asian Food", 
                                                      choices = c("Chinese food" = 1, 
                                                                  "Japanese food" = 2, 
                                                                  "Korean food" = 3,
                                                                  "Vietnamese food" = 4), selected = 2)),
                   data.step = 1,
                   data.intro = "Choose the type of Asian food "
               ),
              
               introBox(
                   
             
               box(width = NULL,radioButtons("rating", label = "Rating of Food", choices = c("Poisonous" = 1,
                                                                                      "edible" = 2,
                                                                                      "Acceptable" = 3,
                                                                                      "Joyful" = 4,
                                                                                      "Strongly recommended" = 5), selected = 3)),
               data.step = 2,
               data.intro = "Have a look at the rating"
               ),
               
              
             
               introBox(actionButton("help", 
                                     label = NULL, 
                                     icon = icon("info"),
                                     style = "color: #fff; background-color: #DD4B39; border-color: #E82E17; padding-left: 80px; padding-right: 80px"
                                     ),
                        data.step = 4,
                        data.intro = "play with the demo again :)"
                        ),
               br(), br(), br(), 
              
               
               box(width = NULL,title = "Comments", textOutput("text"))
               )
        
        
    )
)

siderbar <- dashboardSidebar(disable = T)

dashboardPage(header, siderbar, body, skin = "red")