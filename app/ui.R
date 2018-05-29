###########################################################################################################################
#                                                                                                                         #
#                                             LOAD PACKAGES/FUNCTIONS/DATA                                                #
#                                                                                                                         #
###########################################################################################################################

library(shiny)
library(shinycssloaders)
library(shinydashboard)
library(markdown)
library(DT)

# Load functions
source("R/Get_Revenue_Actions.R")
source("R/Find_NN.R")

###########################################################################################################################
#                                                                                                                         #
#                                                    USER INTERFACE                                                       #
#                                                                                                                         #
###########################################################################################################################

ui <- dashboardPage(
  dashboardHeader(title = "Government Contractors Nearest Neighbors", titleWidth = 500),
  dashboardSidebar(width = 300,
    sidebarMenu(
      menuItem("Home", tabName = "home", icon = icon("home")),
      menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
      selectizeInput(inputId = "names",
                     label = "Choose company:",
                     choices = NULL
                     ),
      sliderInput(inputId = "n_neighbors",
                  label = "Choose number of neighbors:",
                  min = 1,
                  max = 50,
                  value = 5, 
                  step = 1),
      sliderInput(inputId = "revenue",
                  label = "Choose total revenue:",
                  min = 0,
                  max = 5000000000,
                  value = c(1000000000,5000000000), 
                  step = 5000,
                  dragRange = TRUE),
      sliderInput(inputId = "act",
                  label = "Choose number of actions:",
                  min = 0,
                  max = 5000,
                  value = c(1000,3000), 
                  step = 1,
                  dragRange = TRUE)
      ),
    actionButton("update","Update")
  ),
  dashboardBody(
    
    #tags$head(includeScript("google-analytics.js")),
    
    tabItems(
      tabItem(tabName = "home",
              includeMarkdown("intro.md")
      ),
      tabItem(tabName = "dashboard",
              fluidRow(
                #box(DT::dataTableOutput("contractor_table"), width = 5, title = "All Contractors"),
                box(DT::dataTableOutput("contractor_rev_act_table"), width = 4, title = "Revenue and Actions by Contractor"),
                box(withSpinner(ui_element = DT::dataTableOutput("contractor_nn_table"), type = 5), width = 8, title = "Nearest Neighbors")
              )
      )
    )
  )
)