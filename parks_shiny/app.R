#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

# Define UI for application that draws a histogram
ui <- fluidPage(
    
    # Application title
    titlePanel("Biodiversity in National Parks App"),
    
    p("Number of types of species"),
    
    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            radioButtons("display_var",
                         "Which variable to display",
                         choices = c("Mammal" = "Mammal",
                                     "Bird" = "Bird",
                                     "Reptile" = "Reptile"),
                         selected = "Mammal"
            ),
        ),
        
        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("distPlot")
        )
    )
)

# Define server logic 
server <- function(input, output) {
    
    output$distPlot <- renderPlot({
        # set x-axis label depending on the value of display_var
        if (input$display_var == "Mammal") {
            ggplot(counts_area_sl, aes(x=LatCat2, y = Mammal)) + 
                geom_bar(stat = "identity", fill = "#03783D") +
                xlab("Latitude") + ylab("Number of Mammal Species")
        } else if (input$display_var == "Bird") {
            ggplot(counts_area_sl, aes(x=LatCat2, y = Bird)) + 
                geom_bar(stat = "identity", fill = "#3A9999") +
                xlab("Latitude") + ylab("Number of Bird Species")
        } else if (input$display_var == "Reptile") {
            ggplot(counts_area_sl, aes(x=LatCat2, y = Reptile)) + 
                geom_bar(stat = "identity", fill = "#86C14C") +
                xlab("Latitude") + ylab("Number of Reptile Species")
        } 
        
    })
}


# Run the application
shinyApp(ui = ui, server = server)
