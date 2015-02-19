NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEI=transform(NEI,year=factor(year))
usedata=NEI[which(NEI$fips=="24510"),]
Value=NULL
for(i in 1:4){
        obs=sum(usedata$Emissions[which(usedata$year == levels(usedata$year)[i])])
        Value=c(Value,obs)
        }
plot(Value,type="l",axes=F,xlab="Year",ylab="emissions of PM2.5 in Baltimore")
axis(2)
axis(1,at=c(1:4),labels=c(levels(NNN$year)))
points(c(1:4),Value,pch=19)
dev.copy(png,file="plot2.png")
dev.off()
