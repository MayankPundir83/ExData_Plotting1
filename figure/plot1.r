temp <- tempfile()
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,temp,method="curl")
data <- subset(read.table(unzip(temp),header = TRUE,sep = ";",colClasses = "character",strip.white = TRUE),Date == '1/2/2007' | Date == '2/2/2007')
final <- cbind(datetime = strptime(paste(as.Date(data$Date, "%m/%d/%Y"),data$Time),"%Y-%d-%m %H:%M:%S"),data)
par(mfrow=c(1,1))
dev.copy(png,"plot1.png",width=480,height=480,units="px")
hist(as.numeric(final$Global_active_power),col = 'red',main = 'Global Active Power',xlab = 'Global Active Power (kilowatts)')
dev.off()
