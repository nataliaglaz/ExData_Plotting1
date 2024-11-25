# Загрузка данных
data <- read.csv("C:/Users/пк/OneDrive/Документы/RStudio/household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE, na.strings="?")

# Преобразование столбцов 'Date' и 'Time' в формат Date/Time
data$DateTime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Фильтрация данных только для 1 и 2 февраля 2007 года
data_filtered <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")
# 4. Линейный график глобальной реактивной мощности
# plot4.R
plot(data_filtered$DateTime, data_filtered$Global_reactive_power, 
     type="l", col="green", 
     xlab="DateTime", ylab="Global Reactive Power (kilowatts)", 
     main="Global Reactive Power over Time")

# Сохраняем линейный график глобальной реактивной мощности в PNG
png("plot4.png", width=480, height=480)
plot(data_filtered$DateTime, data_filtered$Global_reactive_power, 
     type="l", col="green", 
     xlab="DateTime", ylab="Global Reactive Power (kilowatts)", 
     main="Global Reactive Power over Time")
dev.off()  # Закрытие устройства