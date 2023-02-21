
Url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(Url,"./ExData_Plotting1/Project.zip")
unzip(zipfile="./ExData_Plotting1/Project.zip",exdir="./ExData_Plotting1/Project")
household_power <- read.table("./ExData_Plotting1/Project/household_power_consumption.txt",sep=";", header=TRUE,stringsAsFactors=FALSE, dec=".")
household_power <- household_power[household_power$Date %in% c("1/2/2007","2/2/2007") ,]
Global_active_power <- household_power$Global_active_power
Global_active_power <- as.numeric(Global_active_power)
hist(Global_active_power, col = "red", main = "Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "./ExData_Plotting1/plot1.png",width=480,height=480)
dev.off()
