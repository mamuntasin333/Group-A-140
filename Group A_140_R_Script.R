View(melb_data)
class(melb_data$Date)
mean(melb_data$Price)
summary(melb_data)
class(melb_data$Price)
class(melb_data$Distance)
melb_data$Date_formatted<-melb_data$Date
class(melb_data$Date_formatted)
melb_data$Date_formatted <- format(melb_data$Date_formatted, "%d-%m-%Y")
melb_data$Date_formatted <- as.Date(melb_data$Date_formatted, format="%d/%m/%Y")
class(melb_data$Date_formatted)
melb_data_subset<- subset(melb_data,format(Date, "%Y") == "2017" & format(Date, "%m") %in% c("01", "02", "03"))
melb_data$Date<- as.Date(melb_data$Date, format="%d/%m/%Y")
class(melb_data$Date)
melb_data_subset<- subset(melb_data,format(Date, "%Y") == "2017" & format(Date, "%m") %in% c("01", "02", "03"))
melb_data_subset$Price_in_million<-melb_data_subset$Price/1000000 
  