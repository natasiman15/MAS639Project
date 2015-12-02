require(XLConnect)
library(ggvis)
library(ggplot2)
library(reshape)
library(maps)
library(dplyr)
library(mapproj)
library(stringr)
link <- "http://www.nsf.gov/statistics/seind14/content/chapter-8/8-18_all.xls"
temp <- tempfile()
download.file(link,temp, method = "curl")

n = 6

colnames1 <- readWorksheetFromFile(temp, "8-18_all", header = FALSE, startRow =4, endRow = 4, startCol = 48, endCol = 56)
colnames2 <- readWorksheetFromFile(temp, "8-18_all", header = FALSE, startRow =4, endRow = 4, startCol = 58, endCol = 69)
colnames <- cbind(colnames1, colnames2)

States <- readWorksheetFromFile(temp, "8-18_all", header = FALSE, startRow =6, endRow =56, startCol = 1, endCol = 1)
Degrees1 <- readWorksheetFromFile(temp, "8-18_all", header= FALSE, startRow = 6, endRow = 56, startCol = 48, endCol = 56)
Degrees2 <- readWorksheetFromFile(temp, "8-18_all", header= FALSE, startRow = 6, endRow = 56, startCol = 58, endCol = 69)

Degrees <- cbind(States,Degrees1, Degrees2)
#rownames(Degrees) <- Degrees$Col1
#Degrees <- subset(Degrees, select = -Col1)
colnames(Degrees) <- cbind("States",colnames)
colnames(Degrees)[1] <- "State"
rm(colnames1,colnames2,States,Degrees1,Degrees2,colnames)

melt_Degrees <- melt(Degrees, id=1)
colnames(melt_Degrees)[1]<- "State"
colnames(melt_Degrees)[2] <- "Year"
colnames(melt_Degrees)[3] <- "Degrees_per_1000"

# ggplot(data = melt_Degrees, aes(x=Year, y = Degrees_per_1000, group = State, colour=State))+ geom_line()+geom_point()

stateIDs <- as.vector(unique(melt_Degrees$State))
Years <- as.vector(unique(melt_Degrees$Year))
melt_Degrees$Year <- as.character(melt_Degrees$Year)

# melt_Degrees %>% 
#   ggvis(x = ~State, y = ~Degrees_per_1000) %>% 
#   filter(Year == eval(input_radiobuttons(choices = Years, label = "Years"))) %>% 
#   layer_bars()

Degrees$State <- tolower(Degrees$State)
Degrees$State <- str_trim(Degrees$State,side="right")
colnames(Degrees)[2:22] <- paste("Y",colnames(Degrees)[2:22],"Y",sep="")

#IMPORT STATES
states <- map_data("state")
state_data <- merge(states,Degrees, by.x="region",by.y="State")


#TRY1
qplot(long, lat, data = state_data, group = group, fill = Y2011Y, geom="polygon")

#TRY2
ggplot() + geom_polygon(data=state_data,aes(x=long, y=lat, group=group,fill=as.numeric(Y2010Y)))+
  scale_fill_gradient("test",low="#99d8c9", high="#00441b") +
  geom_path(data=state_data, 
            aes(x=long, y=lat, group=group), color='grey', size=0.15, alpha=0.6) + 
  coord_map()

#TRY 3
state_data %>%
  ggvis(~long,~lat) %>%
  group_by(group) %>%
  layer_paths(fill = ~Y2011Y)


state_data %>%
  ggvis(~long,~lat) %>%
  group_by(group) %>%
  layer_paths(fill = input_radiobuttons(label="year",choices=colnames(Degrees)))
