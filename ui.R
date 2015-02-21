library(shiny)

# Define UI for incident dataset viewer application
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Incident Metrics"),
  
  # Sidebar with controls to provide a caption, select a dataset,
  # and specify the filter criteria to view. 
  
  sidebarLayout(
    sidebarPanel(
      
      checkboxGroupInput("advisor","Advisor",c("EQ"="EQ","HI"="HI","PGA"="PGA")),    
      checkboxGroupInput("severity","Severity",c("2"="2","3"="3","4"="4")),
      selectInput("product", "Choose the software product:", 
                                     choices = c("PATS", "EWS", "PMWS")) ,                                                   
                         
      submitButton(text="Ready") 
    ),
  
    # Show the caption, tab panels with table and graph outputs
  mainPanel(
    
      tabsetPanel(
        tabPanel("Incidents",h2("Incident Data"), dataTableOutput("table1")),
        tabPanel("Graph by Advisor", h2("Number of Incidents by Advisor"), plotOutput("table2")),
        tabPanel("Graph by Cause", h2("Cause of Incidents by Advisor"), plotOutput("table3")),
        tabPanel("About",
                 mainPanel(
                   includeMarkdown("README.md")
                 )    
        )
    )    
  )
  )
)
)
