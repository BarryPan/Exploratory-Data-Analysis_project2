NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEI=transform(NEI,year=factor(year))
Value=NULL
for(i in 1:4){
        obs=sum(NEI$Emissions[which(NEI$year == levels(NEI$year)[i])])
        Value=c(Value,obs)
        }
plot(Value,type="l",axes=F,xlab="Year",ylab="emissions of PM2.5")
axis(2)
axis(1,at=c(1:4),labels=c(levels(NEI$year)))
points(c(1:4),Value,pch=19)
dev.copy(png,file="plot1.png")
dev.off()
