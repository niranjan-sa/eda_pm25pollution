source('load_dataset.R')

#The total of the PM25 levels are divided
#by 1000000 to reduce the range and to 
#improve the readability.
#This has no effect on the analysis.

allsum <- 
  with(nei, tapply(Emissions, year, sum, simplify = FALSE))


x <- names(allsum)
y <- unname(unlist(allsum))


barplot(y/1000000,
         main = "PM25 Pollution Levels Over years",
         xlab = "Years",
         ylab = "Total PM25 Per million",
         col = "darkblue",
         density = 50,
         names.arg = x)

dev.copy(png, 'Plot1.png')
dev.off()