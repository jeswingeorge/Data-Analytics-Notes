## R ShinyTutorial - 13. How to create Value Box in R Shiny Dashboard | - R Programming Tutorials

# value box is like cousin of infobox - similar in nature but appearence is better than infobox
# syntax is almost same with title as 2nd parameter and value as 1st
# put it in another fluid row



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
      menuItem("Detailed Analysis", badgeLabel = 'NEW', badgeColor = 'blue')
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "dashboard",
              
              fluidRow(    # as we want the KPI/infobox above the chart
                infoBox('Sales', value = '99.8%', icon = icon('thumbs-up')),
                infoBox('Conversion %ge', value = '20%', icon = icon('warning')),
                infoBoxOutput('approvedSales')
              ),
              
              fluidRow(
                valueBox(value = 15*890, subtitle = 'Budget for 15 days', icon = icon('hourglass-3')),
                valueBoxOutput('ItemRequested')
              ),
              
              fluidRow(
                tabBox(
                  tabPanel(title = 'Histogram of faithful', status = 'primary', solidHeader = TRUE, plotOutput("histogram")),
                  # can also tell users details about how to use controls br() is an html tag for break
                  tabPanel(title = 'Dashboard controls', status = 'warning', solidHeader = TRUE, 
                           'Use these controls to fine tune your dashboard', br(),
                           'Do not use lot of controls as it confuses the user', br(),
                           sliderInput("bins", "Number of breaks: ", 1, 100, 50),
                           textInput('text_input', 'Search for opportunities', value = '123456'))
                )
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
  
  output$approvedSales <- renderInfoBox({
    infoBox('Approved Sales', value = '89%', icon = icon('bar-chart-o'))
  })
  
  output$ItemRequested <- renderValueBox({
    valueBox(15*20, subtitle = 'Items requested by Employees', icon = icon('toolbox'), color = 'red')
  })
  
}

# Run the application 
shinyApp(ui = ui, server = server)

