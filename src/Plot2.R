source('load_dataset.R')


baltimore <- subset(nei, fips == "24510")
allsum <- with(baltimore, tapply(Emissions, year, sum))

x <- as.numeric(names(allsum))
y <- unname(unlist(allsum))

barplot(y,
        main = "PM25 Pollution Levels Over years for Baltimore city",
        xlab = "Years",
        ylab = "Total PM25 Per",
        col = "skyblue",
        density = 100,
        names.arg = x)

dev.copy(png, 'Plot2.png')
dev.off()

#As per the plot the levels have gone down
#2nd Plot using plot function

plot(x, y, xaxt = 'n', type = 'b', pch=19)
axis(1, at = x, las=2)
title(main = "PM25 Levels in Baltimore",
      xlab = "Years", ylab = "PM25 Levels")

dev.copy(png, 'Plot2.1.png')
dev.off()


