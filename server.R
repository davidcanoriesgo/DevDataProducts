#install.packages("shiny")
#install.packages("UsingR")
#install.packages("devtools")
#library("devtools")
#require(devtools)
#install_github('rCharts', 'ramnathv')
library(shiny)
library(UsingR)
library(ggplot2)
data(diamonds)
shinyServer(
  function(input, output) {
    output$newHist <- renderPlot({
      par(mfrow = c(1, 2))
      
    # First plot
      plot(diamonds$price, diamonds$carat, main="Carat x Price",pch=19,col="lightgoldenrod1")
      carat <- input$carat
      abline(h=carat,col="red",lwd=5)   
      abline(lm(diamonds$carat ~ diamonds$price),col="black",lwd=5)
      
    # Second plot
      hist(diamonds$carat, breaks=100,main = '# Diamonds x carat',xlab='Diamonds carat', ylab='# of Diamonds',col='darkolivegreen1')
      lines(c(carat,carat),c(0,10000),col="blue",lwd=5)
      
      ## Outputs
      # oid1 --> average price for given carat
      output$oid1 <- renderText(mean(diamonds$price[diamonds$carat==carat],na.rm = TRUE))
      # oid2 --> average dimension x for given carat
      output$oid2 <- renderText(mean(diamonds$x[diamonds$carat==carat],na.rm = TRUE))
      output$oid3 <- renderText(mean(diamonds$y[diamonds$carat==carat],na.rm = TRUE))
      output$oid4 <- renderText(mean(diamonds$z[diamonds$carat==carat],na.rm = TRUE))
    })
  }
)