library(shinydashboard)
library(leaflet)
library(gdata)
library(htmltools)
library(data.table)



function(input, output, session){
    df <- data.table(read.xls("data.xlsx"))
    data <- reactive(df[Stars == input$rating & Category == input$type])
     
    observeEvent(input$help,
                 introjs(session, options = list("nextLabel"="next",
                                                 "prevLabel"="back",
                                                 "skipLabel"="skip"),
                         events = list("oncomplete"=I('alert(" It\'s over")')))
    )


    
    output$map <- renderLeaflet({
        berlin <- leaflet() %>%
            addTiles() %>%  # Add default OpenStreetMap map tiles
            addMarkers(data = data(), lng = ~Lon,lat = ~Lat, popup = ~htmlEscape(Address), label = ~htmlEscape(Name)) #%>% 
            # fitBounds(13.76134, 52.675499, 13.0884, 52.33812) %>%
            # addMeasure(
            #     position = "bottomleft",
            #     primaryLengthUnit = "meters",
            #     primaryAreaUnit = "sqmeters",
            #     activeColor = "#3D535D",
            #     completedColor = "#7D4479")
        berlin
    })
    
    
    
    output$text <- renderText({
        "All the ratings and evaluation depends on own personal flavours, it would be normal not to get agreemennt with everyone. "
    })
}