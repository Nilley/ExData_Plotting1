## Loading dataset
w_source <- "./data/household_power_consumption.txt"
w_data <- read.table(w_source,
                   header = TRUE,
                   sep = ";",
                   colClasses = c("character", "character", rep("numeric",7)),
                   na = "?")
dim(w_data) # 2075259 9
attach(w_data)
## We need data of 1/2/2007 and 2/2/2007.
w_subset <- Date == "1/2/2007" | Date == "2/2/2007"
w_new_data <- w_data[w_subset, ]
dim(w_new_data) # 2880   10
attach(w_new_data)
x <- paste(Date, Time)
w_new_data$DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")
rownames(w_new_data) <- 1:nrow(w_new_data)
attach(w_new_data)
