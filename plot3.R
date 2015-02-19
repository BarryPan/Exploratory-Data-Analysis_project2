NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NNN=transform(NEI,year=factor(year))
NNN=transform(NNN,type=factor(type))
usedata=NNN[which(NNN$fips=="24510"),]
Value=NULL
for(i in 1:4){
                for(j in 1:4){
                obs=sum(usedata$Emissions[which(usedata$year == levels(usedata$year)[i] & usedata$type == levels(usedata$type)[j])])
        Value=c(Value,obs)
                }
        Year=c(rep("1999",4),rep("2002",4),rep("2005",4),rep("2008",4))
        }
Year=c(rep("1999",4),rep("2002",4),rep("2005",4),rep("2008",4))
Type=rep(levels(usedata$type),4)
data=cbind(Year,Type,Value)
data=data.frame(data)
data$Value=as.numeric(data$Value)

g=ggplot(data,aes(Year,Value))
g+geom_point()+facet_grid(.~Type)
dev.copy(png,file="plot3.png")
dev.off