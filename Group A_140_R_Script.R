View(melb_data)
class(melb_data$Date)
mean(melb_data$Price)
summary(melb_data)

class(melb_data$Price)
class(melb_data$Distance)
melb_data$Date_formatted<-melb_data$Date
class(melb_data$Date_formatted)


#Converting the Date column into proper Date format (required for subsetting by year/month)
melb_data$Date_formatted <- as.Date(melb_data$Date_formatted, format="%d/%m/%Y")

class(melb_data$Date_formatted)  
melb_data$Date<- as.Date(melb_data$Date, format="%d/%m/%Y")
class(melb_data$Date)
#Creating a subset containing only Jan–Mar 2017 data
melb_data_subset<- subset(melb_data,format(Date, "%Y") == "2017" & format(Date, "%m") %in% c("01", "02", "03"))

write.csv(head(melb_data_subset,5),"clipboard")
#Converting price into millions for easier interpretation and cleaner plots
melb_data_subset$Price_in_million<-melb_data_subset$Price/1000000

png("price_histogram.png", width = 900, height = 700)
#Creating histogram of house prices for early 2017
hist(melb_data_subset$Price_in_million,
     breaks =40,
     col = "lightgreen",
     main="Distribution of House Prices(Jan–Mar 2017)",
     xlab="Price (Million Dollars)",
     ylab = "Frequency",
     ylim = c(0,120),
     las=1)
dev.off()

png("price_histogram-with_bellcurve.png", width = 900, height = 700)
#Creating histogram of distance from Melbourne CBD for early 2017
hist(melb_data_subset$Price_in_million,
     breaks = 20,
     col = "lightgreen",
     main="Distribution of House Prices(Jan–Mar 2017)",
     xlab="Price (Million Dollars)",
     freq = FALSE)
#Adding a density curve to show the smoothed shape of the price distribution..
lines(density(melb_data_subset$Price_in_million),
      col = "blue",
      lwd = 2)
dev.off()

png("distance_histogram.png", width = 900, height = 700)
hist(melb_data_subset$Distance,
     main = "Histogram of Distance from Melbourne CBD(Jan–Mar 2017)",
     xlab = "Distance (km)",
     breaks =40,
     col = "lightgreen",
     xlim = c(0,20),
     ylim = c(0,140)
     )
dev.off()

png("distance_histogram_with_bellcurve.png", width = 900, height = 700)
hist(melb_data_subset$Distance,
     breaks =40,
     main = "Distribution of Distance(Jan–Mar 2017)",
     xlab = "Distance (km)",
     xlim = c(0,20),
     col = "lightgreen",
     freq = FALSE)

lines(density(melb_data_subset$Distance),
      col = "blue",
      lwd = 2)
dev.off()

x<-melb_data_subset$Distance
y<-melb_data_subset$Price_in_million
png("Price_distance_correlation.png", width = 900, height = 700)
#Plotting Price vs Distance to visually inspect whether a correlation exists
plot(x,y,main = "Price vs Distance from Melbourne CBD(Jan–Mar 2017)",
     xlab="Distance(km) from Melbourne CBD",
     ylab = "Price in million dollars",
     pch=19,
     xlim = c(0,20),
     ylim = c(0,4),
     frame=T)
#Using a linear regression model to test the strength of the correltaion
model<-lm(y~x,data = melb_data_subset) 
#Adding regression line to scatterplot to show trend between Price and Distance
 abline(model,col="blue")
 dev.off()
 
 #Performing Pearson correlation test to check statistical significance of the relationship
 cor(melb_data_subset$Distance, melb_data_subset$Price_in_million,
     method = "pearson")
 cor.test(melb_data_subset$Distance, melb_data_subset$Price_in_million)
 #Performing Kendall correlation test to check statistical significance of the relationship
 cor(melb_data_subset$Distance, melb_data_subset$Price_in_million,
     method = "kendall")
 
 cor.test(x, y, method="pearson")
 cor.test(x, y, method="spearman")
 
