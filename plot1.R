# Загрузка данных
data <- read.csv("C:/Users/пк/OneDrive/Документы/RStudio/household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE, na.strings="?")

# Преобразование столбцов 'Date' и 'Time' в формат Date/Time
data$DateTime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Фильтрация данных только для 1 и 2 февраля 2007 года
data_filtered <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

# 1. Гистограмма глобальной активной мощности (Global Active Power)
# plot1.R
hist(data_filtered$Global_active_power, 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", 
     col="red")  # Строим гистограмму

# Сохраняем гистограмму в PNG
png("plot1.png", width=480, height=480)
hist(data_filtered$Global_active_power, 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", 
     col="red")  # Строим гистограмму
dev.off()  # Закрытие устройства


