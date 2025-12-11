# Load required libraries
library(readr)
library(ggplot2)

# Load dataset
data <- read_csv("melb_data.csv")

# Remove missing values
data <- na.omit(data[, c("Price", "Distance")])

# Create distance group
data$DistanceGroup <- ifelse(data$Distance <= 10, "Within 10 km", "Beyond 10 km")

# Visualisation: Boxplot
ggplot(data, aes(x = DistanceGroup, y = Price)) +
  geom_boxplot() +
  labs(
    title = "House Prices Based on Distance from Melbourne CBD",
    x = "Distance Group",
    y = "Price (AUD)"
  )

# Perform independent t-test
t_test_result <- t.test(Price ~ DistanceGroup, data = data)

# Print test results
print(t_test_result)

