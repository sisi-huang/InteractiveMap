library(shinydashboard)
library(leaflet)

header <- dashboardHeader(title = "Asian Food in Berlin")
body <- dashboardBody(
    fluidRow(
        tags$style(type="text/css",
                   ".shiny-output-error { visibility: hidden; }",
                   ".shiny-output-error:before { visibility: hidden; }"
        ),
        box(width = 10, leafletOutput("map", height = 600)),
        column(width = 2,
               box(width = NULL,selectInput("type", label = "Type of Asian Food", 
                               choices = c("Chinese food" = 1, "Japanese food" = 2, "Korean food" = 3, "Vietnamese food" = 4), selected = 2)),
               box(width = NULL,radioButtons("rating", label = "Rating of Food", choices = c("Poisonous" = 1,
                                                                                      "edible" = 2,
                                                                                      "Acceptable" = 3,
                                                                                      "Joyful" = 4,
                                                                                      "Strongly recommended" = 5), selected = 3)),
               
              
               br(), br(), br(), br(), br(), 
              
               
               box(width = NULL,title = "Comments", textOutput("text"))
               )
        
        
    )
)

siderbar <- dashboardSidebar(disable = T)

dashboardPage(header, siderbar, body, skin = "red")