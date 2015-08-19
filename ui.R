shinyUI(navbarPage("Data Product: Diamons analysis",
                   tabPanel("Documentation",
                            h2("Diamonds data analysis"),
                            hr(),
                            h3("Description"),
                            helpText("Diamonds data contains ~ 540000 round diamonds, including,",
                                     " information about carat, colour, clariry, cut,",
                                     " depth, width, height (its dimensions)."),
                            h3("Format"),
                            p("A data frame with 53940 observations on 10 variables."),
                            
                            p("  [, 1]   carat: weight of diamond stones in carat unit"),
                            p("  [, 2]	 cut: diamond's quality"),
                            p("  [, 3]	 color: a factor with levels (D,E,F,G,H,I)"),
                            p("  [, 4]	 clarity: a factor with levels (IF,VVS1,VVS2,VS1,VS2)"),
                            p("  [, 5]	 depth: percentage ratio diameter / depth (dimension)"),
                            p("  [, 6]	 table: percentage ratio total width / width table"),
                            p("  [, 7]	 price: i USD"),
                            p("  [, 8]	 x: dimension 1"),
                            p("  [, 9]	 y: dimension 2"),
                            p("  [,10]	 z: dimension 3"),
                            
                            
                            h3("App Details"),
                            
                            p("As a user, you will only have to select the Carat of the diamond"),
                            p("Application provides you with:"),
                            p("- Plot 1: Carat by price (with a regression line and a moving bar for the selected carat)"),
                            p("- Plot 2: # Diamonds by selected carat (with a moving bar for the selected carat)"),
                            p("- Conclusions on the selected carat: average price and dimensions."),
                            p(" "),
                            p("Note: Carat should have a value between 0 and 5.10")
                            
                   ),
                   tabPanel(
                     "Diamonds Carat and Price Application",
                     sidebarPanel(
                       numericInput('carat', 'Input Carat',0.30, min = 0, max = 5.10, step = 0.01,)
                     ),
                     mainPanel(
                       plotOutput('newHist'),
                       h3('Conclusions of data exploration for selected carat:'),
                       h4('Average diamond price is $:'), textOutput("oid1"),
                       h4('Average dimensions x,y,z: '), textOutput("oid2"), textOutput("oid3"), textOutput("oid4")
                     )
                   )
                   ))