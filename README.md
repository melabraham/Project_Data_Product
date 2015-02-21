## Welcome to Incident data explorer

This application is used to view and analyze the incident data 

Source code is available on GitHub.

This project requires the following files to be present in a working directory -
  R files : ui.R,server.R and global.R 
  dataset file : incidentdataset.csv 

Also, the following packages should be installed in the working environment
  Shiny packages : shiny, shinyapps
  R packages:gglot2, markdown
  

### global.R script
The global.R script loads the libraries and reads data from the incident csv file dataset into variable imdataset

### ui.R script
titlePanel() give the app page a title
sidebarLayout() uses the sidebarPanel() and mainPanel() argument

On the sidebar panel, you can select the advisor(s)and severity(s) of the incidents using checkbox
The software product can be selected from the dropdown


the mainPanel() displays the output in tab panels. 
the incident panel is to view the data, and the graph panels to view the data graphically


### server.R script
based on the selection criteria and clicking the ready button the filtered values are displayed in the 3 panels.

Only a subset of columns are selected from the incdent dataset for display purposes.

renderdataTable() and renderplot() functions are assigned to the output variables to be displayed on the UI.

for plotting the graphs, aggregate function is used to get a count of incidents by the selection criteria.

### running the script
run the command runApp()

this will bring up the browser and load the data from the incident dataset. Based on the options selected on the UI the values will be displayed in the 3 tab panels.