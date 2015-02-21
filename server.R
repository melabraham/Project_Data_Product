library(shiny)



# Define server logic required to summarize and view the selected

shinyServer(function(input, output) {
  
  
  data <- reactive({
    a <- subset(imdataset, advisor %in% input$advisor & severity %in% input$severity &
                  product %in% input$product)
    a <- droplevels(a)
  #  return(a)
  })
  
  output$table1 <- renderDataTable({
    a <- data()
    t1 <- a[,c("P_NUMBER","Incident.Date","advisor","product","severity","CAUSE_CODE","RESOLUTION_CODE")]
    colnames(t1) <- c("INCIDENT_NUMBER","INCIDENT_MONTH","ADVISOR","PRODUCT","SEVERITY","CAUSE_CODE","RESOLUTION_CODE")  
    t1
  })
  
 output$table2 <- renderPlot({
   a <- data()
   t1 <- a[,c("Incident.Date","severity", "advisor")]
   
   ag.t1 <- aggregate(t1$severity, by=list(t1$Incident.Date,t1$advisor), FUN=length)
   colnames(ag.t1) <- c("Incident_Month","Advisor","Incident_Count")
   ggplot(data = ag.t1, aes(Incident_Month, Incident_Count, fill = Advisor)) + geom_bar(stat = "identity")
 })
  
 output$table3 <- renderPlot({
   a <- data()
   t1 <- a[,c("CAUSE_CODE","severity", "advisor")]
    
   ag.t1 <- aggregate(t1$severity, by=list(t1$CAUSE_CODE,t1$advisor), FUN=length)
   colnames(ag.t1) <- c("CAUSE_CODE","Advisor","Incident_Count")
   ggplot(data = ag.t1, aes(CAUSE_CODE, Incident_Count, fill = Advisor)) + geom_bar(stat = "identity")
 })
 
})
