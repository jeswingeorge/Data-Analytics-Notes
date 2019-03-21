#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)

# Define UI for application that draws a histogram
ui <- dashboardPage(
  
  dashboardHeader(title = "Dashboard Header"),
  dashboardSidebar(
    sliderInput("bins", "Number of breaks: ", 1, 100, 50),
    sidebarMenu(
      menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
      menuSubItem("Dashboard Finance", tabName = "Finance"),
      menuSubItem("Dashboard Retail", tabName = "Retail"),
      menuItem("Detailed Analysis")
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "dashboard",
        fluidRow(
        box(plotOutput("histogram"))
      )),
      
      tabItem(tabName = "Finance",
              h1("Finance Dashboard")),
      tabItem(tabName = "Retail",
              h1("Retail Dashboard"))
    )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  output$histogram <-renderPlot({
    hist(faithful$eruptions,breaks = input$bins)
  })
}

# Run the application 
shinyApp(ui = ui, server = server)

