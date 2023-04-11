library(shiny)
require(ggplot2)
require(dplyr)

# Define UI for application that draws a histogram
ui <- fluidPage(
    # Application title
    titlePanel("Hello Shiny World!"),

    # Sidebar with a slider input for the number of bins
	sidebarPanel(
	    selectInput("distribution","Choice of Distribution", choices = c("normal", "gamma"), selected = "normal"),
	    sliderInput("num",
		        "Number of Samples:",
		        min = 1,
		        max = 5000,
		        value = 2500),
	    conditionalPanel(
	      condition = "input.distribution == 'normal'",
	      numericInput("mean", "Mean: ", value=0),
	      numericInput("sd", "Standard deviation:",
	                 value = 1, min=0.0001)
	    ),
	    conditionalPanel(
	      condition = 'input.distribution == "gamma"',
	      numericInput("shape", "Shape: ", value=1, min = 0.00001),
	      numericInput("scale", "Scale: ", value=1, min = 0.00001)
	    )
	),

	# Show a plot of the generated distribution
	mainPanel(
	    plotOutput("hist")
	)
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    output$hist <- renderPlot({
      if(input$distribution=="normal") {
        xmin <- -10
        dist <- rnorm(n = input$num, mean = input$mean, sd = input$sd)
      }
      if(input$distribution=="gamma") {
        xmin <- 0
        # need to get shape and scale
        dist <- rgamma(n = input$num, shape=input$shape, scale=input$scale)
      }
      data.frame(dist) %>%
          ggplot(aes(x = dist)) +
          geom_histogram(binwidth = 0.25) +
          xlim(c(xmin,10))
    })
}

# Bind ui and server together
shinyApp(ui, server)

