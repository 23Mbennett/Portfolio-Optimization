#Basic Portfolio Optimixation: Minimum Variance Portfolio & Efficent Frontier
install.packages("timeSeries")
install.packages("fPortfolio")
install.packages("quantmod")
install.packages("caTools")
install.packages("PerformanceAnalytics")
install.packages("ggplot2")
install.packages("timeDate")
library(timeSeries)
library(fPortfolio)
library(quantmod)
library(caTools)
library(dplyr)
library(PerformanceAnalytics)
library(ggplot2)
library(timeDate)

#Get your tickers
AAPL <- getSymbols("AAPL", from ="2010-1-1", auto.assign = F)[,4]
GD <- getSymbols("GD", from = "2010-1-1", auto.assign= F)[,4]
BABA <- getSymbols("BABA", from = "2010-1-1", auto.assign = F)[,4]
MSFT <- getSymbols("MSFT", from = "2010-1-1", auto.assign = F)[,4]
BAC <- getSymbols("BAC", from = "2010-1-1", auto.assign = F)[,4]
BND <- getSymbols("BND", from = "2010-1-1", auto.assign = F)[,4]
FCX <- getSymbols("FCX", from = "2010-1-1", auto.assign = F)[,4]
NVO <- getSymbols("NVO", from = "2010-1-1", auto.assign = F)[,4]
BND <- getSymbols("BND", from = "2010-1-1", auto.assign = F)[,4]
PRU <- getSymbols("PRU", from = "2010-1-1", auto.assign = F)[,4]
#Make a data frame with your tickers prices
tickers <- cbind.data.frame(AAPL, GD, BAC, FCX, NVO, PRU)
#Turn that data frame into timeseries class data 
portfolioReturns <- as.timeSeries(tickers)
#Make & plot efficent frontier
efficient_frontier <- portfolioFrontier(portfolioReturns, constraints = "longOnly")
plot(efficient_frontier, c(1,2,3))
#get the efficient frontier weights
frontier_weights <- getWeights(efficient_frontier)
View(frontier_weights)
#get minimum variance portfolio
minvariancePortfolio(portfolioReturns, constraints = "longOnly")
#get portfolio tangent with frontier
tangencyPortfolio(portfolioReturns, constraints="longOnly") 
#correlation matrix
cor(portfolioReturns)
