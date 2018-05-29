###########################################################################################################################
#                                                                                                                         #
#                                             LOAD PACKAGES/FUNCTIONS/DATA                                                #
#                                                                                                                         #
###########################################################################################################################

# Load packages
library(shiny)
library(shinydashboard)
library(dplyr)
library(DT)

# Load functions
source("R/Get_Revenue_Actions.R")
source("R/Find_NN.R")

# # Load data
vendornames = read.csv("data/total_dollars_obligated_total_actions_duns_vendor_names.csv")
vendornames = sort(unique(vendornames$vendorname))

###########################################################################################################################
#                                                                                                                         #
#                                                         SERVER                                                          #
#                                                                                                                         #
###########################################################################################################################

server <- function(input, output, session){
  
  updateSelectizeInput(session = session,
                         inputId = "names", 
                         label = "Choose company:",
                         choices = vendornames, 
                         server = TRUE)
  
  #################################################################
  #                                                               #
  #                      REACTIVE VALUES                          #
  #                                                               #
  #################################################################
  
  v <- reactiveValues(doPlot = FALSE)
  
  # Check to see if update button was clicked
  observeEvent(input$update, {
    v$doPlot <- input$update
  })
  
  #################################################################
  #                                                               #
  #                       REACTIVE DATA                           #
  #                                                               #
  #################################################################
  
  # If update button was clicked get cluster designation data
  # cluster_data <- eventReactive(input$update, {
  #   
  #   colnames(Data) = c("DUNS", "Vendor Name", "Cluster")
  #   Data
  # })
  
  #################################################################
  #                                                               #
  #                         OUTPUTS                               #
  #                                                               #
  #################################################################

  
  # output$contractor_table <- renderDataTable({
  #   if (v$doPlot == FALSE) return()
  #   
  #   isolate({
  #     
  #     datatable(cluster_data(), 
  #               options = list("pageLength" = 20),
  #               caption = "All Contractors: This is a list of all the companies in the data. Use this table to search for a company
  #               to find what cluster it belongs to.",
  #               rownames = FALSE)
  #   })
  #   
  # }) # End contractor_table
  

  output$contractor_rev_act_table <- renderDataTable({
      
    validate(
      need(expr = input$names != "", 
           message = "Please select a company in the left hand menu")
      )
    Output = Get_Revenue_Actions(company = input$names)
    Output
    
    
    }) # End contractor_per_cluster_table
    
  output$contractor_nn_table <- renderDataTable({
    if (v$doPlot == FALSE) return()

    isolate({
      
      Output = Find_NN(k = input$n_neighbors,
                       company = input$names,
                       minRev = input$revenue[1],
                       maxRev = input$revenue[2],
                       minAct = input$act[1],
                       maxAct = input$act[2],
                       includeAct = TRUE)

      Output
    })

  }) # End cluster_table
  
  
  
} # End server
