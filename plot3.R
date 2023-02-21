#Downloading the data set
Url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(Url,"./ExData_Plotting1/Project.zip")
unzip(zipfile="./ExData_Plotting1/Project.zip",exdir="./ExData_Plotting1/Project")
#reading the text file as a table
household_power <- read.table("./ExData_Plotting1/Project/household_power_consumption.txt",sep=";", header=TRUE,stringsAsFactors=FALSE, dec=".")
#sub-setting the data for the given dates
household_power <- household_power[household_power$Date %in% c("1/2/2007","2/2/2007") ,]
#creating a time variable using date and time
time <- strptime(paste(household_power$Date, household_power$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
#scatter plot for three variables
plot(time, household_power$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
points(time, household_power$Sub_metering_1, type = "l")
points(time, household_power$Sub_metering_2,type ="l", col = "red")
points(time, household_power$Sub_metering_3,type ="l", col = "blue")
#legend representing each variable
legend("topright",lty = 1,col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.5)
dev.copy(png, file = "./ExData_Plotting1/plot3.png", width = 480, height = 480)
dev.off()
