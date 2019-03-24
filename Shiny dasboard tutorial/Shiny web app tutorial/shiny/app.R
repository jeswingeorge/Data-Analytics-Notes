
# R shiny widget is a text input shiny widget




library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Text Input Shiny Widget"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
         textInput('projcode', 'Enter your project code '),
         textInput('projName', 'Enter your project Name '),
         textInput('tech', 'Enter technology you are using ')
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         textOutput('project_code'),
         textOutput('project_Name'),
         textOutput('techName')
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  output$project_code <- {(
    renderText(input$projcode)
  )}
  
  output$project_Name <- {(
    renderText(input$projName)
  )}
  
  output$techName <- {(
    renderText(input$tech)
  )}
  
}

# Run the application 
shinyApp(ui = ui, server = server)

