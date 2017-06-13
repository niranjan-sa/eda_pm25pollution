source('load_dataset.R')

#Subset data for Baltimore city.
data <- nei[nei$fips=='24510',]

#Perform aggregation on multiple factors.
result <- aggregate(Emissions ~ year+type, data, sum)

#finally plot the data
library(ggplot2)
png(filename = "Plot3.png" ,width = 480, height = 640, units = 'px')
g + geom_line(color = 'blue', linetype = 4,
              size = 1) + facet_wrap(~type)

#dev.copy(png, 'Plot3.png')
dev.off()

#Alternative approach
png(filename = "Plot31.png" ,width = 480, height = 480, units = 'px')
g <- ggplot(result, aes(year, log10(Emissions), color=type))
g + geom_line() + ggtitle(label = "Emissions levels of different modes in Baltimore City") 

dev.off()

