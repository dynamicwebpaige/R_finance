#! /usr/bin/R

# IBM finance data pulled from Yahoo! Finance on 2/13/2015

library(ggplot2)

# Read two accompanying .csv files
IBM_dividends <- read.csv(file="IBM_dividends.csv", header=TRUE, sep=",')
IBM_finance <- read.csv(file="IBM_finance.csv", header=TRUE, sep=",")

# Plotting dividends over time
qplot(as.Date(IBM_dividends$Date, "%m/%d/%Y"),IBM_dividends$Dividends, data=IBM_dividends, xlab="Date", ylab="Dividends (in Dollars)",ylim=c(0.0,1.2))

# Plotting closing prices of stock over time
# Note the splits
qplot(as.Date(IBM_finance$Date, "%m/%d/%Y"),IBM_finance$Close, data=IBM_finance, xlab="Date", ylab="IBM Closing Prices (in Dollars)", col=" ")

# Opening prices over time
qplot(as.Date(IBM_finance$Date, "%m/%d/%Y"),IBM_finance$Open, data=IBM_finance, xlab="Date", ylab="IBM Opening Prices (in Dollars)", col=" ")

# Plotting difference in market highs and lows over time
IBM_finance$Difference <- IBM_finance$High - IBM_finance$Low
plot(as.Date(IBM_finance$Date, "%m/%d/%Y"),IBM_finance$Difference, data=IBM_finance, xlab="Date", ylab="Stock Market Prices", col = "green", pch=20)