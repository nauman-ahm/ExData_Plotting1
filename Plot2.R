library("lubridate")
if (!file.exists("household_power_consumption.txt"))
{
  if (!file.exists("household_power_consumption.zip"))
  {
    download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "household_power_consumption.zip")
  }
  unzip("household_power_consumption.zip")
}
data<-read.table("household_power_consumption.txt", sep = ";", header = TRUE)
data$Date<-as.Date(data$Date, "%d/%m/%Y")
data<- data[((data$Date == "2007-02-01")|(data$Date == "2007-02-02")) ,]
data$Global_active_power<-as.character(data$Global_active_power)
data$Global_active_power<-as.numeric(data$Global_active_power)
data$Sub_metering_1<-as.character(data$Sub_metering_1)
data$Sub_metering_1<-as.numeric(data$Sub_metering_1)
data$Sub_metering_2<-as.character(data$Sub_metering_2)
data$Sub_metering_2<-as.numeric(data$Sub_metering_2)
data$Sub_metering_3<-as.character(data$Sub_metering_3)
data$Sub_metering_3<-as.numeric(data$Sub_metering_3)
data$Time<-as.character(data$Time)
data$DateTime <- paste(data$Date, data$Time)
data$DateTime<-ymd_hms(data$DateTime)

## PLOT 2
with(data, plot(DateTime, Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type = "n"))
with(data, lines(DateTime, Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = ""))
dev.copy(png, "plot2.png")
dev.off()