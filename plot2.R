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
#scatter plot using the type as lines                      
plot(time, household_power$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png, file = "./ExData_Plotting1/plot2.png", width = 480, height = 480)
dev.off()
