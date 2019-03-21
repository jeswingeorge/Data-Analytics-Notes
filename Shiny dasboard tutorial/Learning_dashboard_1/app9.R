## R ShinyTutorial - 9. How to Add Multiple Controls on Side Bar | - R Programming Tutorials

# - can add search functionality in sidebar Eg: search functionalty using -  textInput, sidebarSearchForm

# apart from sidebar we can add controls to dashboard body using box


library(shiny)
library(shinydashboard)

# Define UI for application that draws a histogram
ui <- dashboardPage(
  
  dashboardHeader(title = "Dashboard Header", dropdownMenuOutput("msgOutput"),
                  # dropdownMenu(type = "message",
                  #              messageItem(from = "Finace Update", message = "We are on threshold"),
                  #              messageItem(from = "Retail Update", message = "Sales down by 18%, need aggressive marketing", icon = icon("bar-chart-o"), time = "09:50"),
                  #              messageItem(from = "Retail Update", message = "Meeting at 15:00", icon = icon("handshake-o"), time = "19:50 / 20-03-2019")
                  #              
                  # )
                  
                  dropdownMenu(type = "notifications",
                               notificationItem(
                                 text = '2 new tabs added to the dashboard',
                                 icon = icon("dashboard"),
                                 status = "success"
                               ),
                               notificationItem(
                                 text = 'server is currently running at 95% load',
                                 icon = icon("warning"),
                                 status = "warning"
                               )
                               
                  ),
                  
                  dropdownMenu(type = "tasks",
                               taskItem(
                                 text = 'Shiny Dashboard Eduction', # task name
                                 value = 80,
                                 color = 'aqua'
                               ),
                               taskItem(
                                 text = 'Overall R Education', # task name
                                 value = 30,
                                 color = 'red'
                               ),
                               taskItem(
                                 text = 'Data Science Eduction', # task name
                                 value = 50,
                                 color = 'green'
                               )
                  )
                  
  ),
  dashboardSidebar(
    sidebarMenu(
      sidebarSearchForm("SearchText", "searchButton","Search"),   # for it to work congfigure for this in server sides'code
      menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
        menuSubItem("Dashboard Finance", tabName = "Finance"),
        menuSubItem("Dashboard Retail", tabName = "Retail"),
      menuItem("Detailed Analysis", badgeLabel = 'NEW', badgeColor = 'blue'),
      sliderInput("bins", "Number of breaks: ", 1, 100, 50),
      textInput('text_input', 'Search for opportunities', value = '123456')
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
  output$msgOutput <- renderMenu({
    df <- read.csv('message.csv')
    msgs <- apply(df, 1, function(row) {messageItem(from = row[['from']], message = row[['message']])})
    dropdownMenu(type = 'messages', .list = msgs)
  })
}

# Run the application 
shinyApp(ui = ui, server = server)

