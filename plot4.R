NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NNN=transform(NEI,year=factor(year))
NNN=transform(NNN,type=factor(type))
w=SCC$SCC[which(SCC$EI.Sector==levels(SCC$EI.Sector)[13])]
usedata=NNN[which(NNN$SCC==w),]
Value=NULL
for(i in 1:4){
        obs=sum(usedata$Emissions[which(usedata$year == levels(usedata$year)[i])])
        Value=c(Value,obs)
        }
plot(Value,type="l",axes=F,xlab="Year",ylab="Coal Combustion related Emissions")
axis(2)
axis(1,at=c(1:4),labels=c(levels(NNN$year)))
points(c(1:4),Value,pch=19)
dev.copy(png,file="plot4.png")
dev.off()