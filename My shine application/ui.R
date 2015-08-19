library(shiny)
library(datasets)

cars1 <- mtcars
car_names1 <- as.character(row.names(cars1))
car_names1 <- unlist(car_names1)


shinyUI(
     fluidPage(
     titlePanel("Converter from mpg to km/l"),
     
     sidebarLayout(
          sidebarPanel(position = "right",
               h3("Car Selection"),
               helpText("Please select one of the models availables in the data set. Do not forget to click submit to get the 
                        consumption in km/l"),
               
               selectInput("var", 
                           label = "Choose the car",
                           choices = car_names1,
                           selected = car_names1[1]),
               submitButton('Submit')
          ),
                              
          mainPanel(
               h3("INSTRUCTIONS: How to use the application"),
               p("The application car database is based on the datasets availables in R. In particular, the dataset",
                    em("mtcars"), 
                 "The data was extracted from the 1974 Motor Trend US magazine, and comprises fuel consumption and 10 aspects, 
                 of automobile design and performance for 32 automobiles (1973-74 models)."),
               br(),
               p("The application will automatically convert the consumption from mpg to km/l for a better understanding of the 
                 europeans. Once you select the model, you have to click in submit button in order to be able to obtain the value 
                 in km/l. As an example, the conversion for the first model is displayed. You will find the conversion bellow the
                 instructions."),
               h4("Car Selected"),
               verbatimTextOutput("carselected"),
               h4("Consumption in mpg"),
               verbatimTextOutput("mpgvalue"),
               h4("Consumption in km/l"),
               verbatimTextOutput("prediction")
          )
     )
))