# Загрузка данных
data <- read.csv("C:/Users/пк/OneDrive/Документы/RStudio/household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE, na.strings="?")

# Преобразование столбцов 'Date' и 'Time' в формат Date/Time
data$DateTime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Фильтрация данных только для 1 и 2 февраля 2007 года
data_filtered <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")
# 3. Линейный график с тремя субметрингами энергии
# plot3.R
plot(data_filtered$DateTime, data_filtered$Sub_metering_1, 
     type="l", col="black", 
     xlab="DateTime", ylab="Energy Sub Metering", 
     main="Energy Sub Metering")
lines(data_filtered$DateTime, data_filtered$Sub_metering_2, col="red")
lines(data_filtered$DateTime, data_filtered$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty=1)

# Сохраняем линейный график с субметрингами в PNG
png("plot3.png", width=480, height=480)
plot(data_filtered$DateTime, data_filtered$Sub_metering_1, 
     type="l", col="black", 
     xlab="DateTime", ylab="Energy Sub Metering", 
     main="Energy Sub Metering")
lines(data_filtered$DateTime, data_filtered$Sub_metering_2, col="red")
lines(data_filtered$DateTime, data_filtered$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty=1)
dev.off()  # Закрытие устройства