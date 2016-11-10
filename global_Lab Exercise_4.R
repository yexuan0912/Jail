install.packages("shiny")
install.packages("shinydashboard")
install.packages("highcharter")
install.packages("dplyr")
install.packages("tidyr")
install.packages("rdrop2")
install.packages("lubridate")
install.packages("RCurl")


library(shiny)
library(shinydashboard)
library(highcharter)
library(dplyr)
library(tidyr)
library(rdrop2)
library(lubridate)
library(RCurl)

setwd("C:\\Users\\ygu23\\Desktop\\Academic\\UP494\\LabExercise4")

data <- read.csv('djlsummary.all_LE4.csv')    
data$Date <- as.Date(data$custDate, format="%m/%d/%Y")
y.limit <- max(data$popTot)
output.table <- data
Chg.Tot.Pop <- diff(data$popTot) 
daye <- lubridate::wday(data$custDate, label=T, abbr = F)

k <- list()
for (i in 1:((length(daye)) - 1)) {
  k[i] <- (paste0(daye[i], " to ", daye[i+1], ""))   
}
Chg.Tot.Pop.Labels <- as.character(k)
change.data <- cbind.data.frame(Chg.Tot.Pop.Labels, Chg.Tot.Pop)
colnames(change.data ) <- c("Period", "Change in Total Population")

lval <- dim(data)[1]
lval <- lval * -1
data.sorted <- data[order(-1:lval),] 


