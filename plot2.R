# Exploratory Data Analysis - Course Project 1

library(readr)
data <- read_delim("Your directory",";", escape_double = FALSE, trim_ws = TRUE)


#setting the data from Feb. 1, 2007 to Feb. 2, 2007
data$Date <- as.Date(data$Date, "%d/%m/%Y")

data <- subset(data,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

data <- data[complete.cases(data),]

# date and time in the same colum
dateTime <- paste(data$Date, data$Time)


## Name the vector
dateTime <- setNames(dateTime, "DateTime")

## Remove Date and Time column
data <- data[ ,!(names(data) %in% c("Date","Time"))]

## Add DateTime column
data <- cbind(dateTime, data)
data$dateTime <- as.POSIXct(dateTime)


#plot 2 
plot(data$Global_active_power~data$dateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
