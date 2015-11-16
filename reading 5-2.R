require(XLConnect)
link <- "http://www.nsf.gov/statistics/2015/nsf15311/tables/tab5-2.xlsx"


temp <- tempfile()
download.file(link,temp, method = "curl")

Column_names <- readWorksheetFromFile(temp,"sheet1", header = FALSE, startRow = 2, endRow = 2, startCol = 1, endCol = 12)
Column_names <- append(Column_names, "Sex")

Field_level1 <- c("All Fields", "S&E Total",rep("Science",24), rep("Engineering", 9), "Non S&E")
Field_level2 <- c("All Fields", "S&E Total", "Science", "Agricultural Sciences", "Biological Sciences", 
                  "Computer Sciences", rep("Earth, atmospheric and ocean sciences",4), 
                  "Mathematics and statistics", rep("Physical Sciences",5),"Psychology", rep("Social Sciences",9),
                  rep("Engineering",9), "Non-SE")

## Both Sexes
Both_Sexes <- readWorksheetFromFile(temp, "sheet1", header = FALSE, startRow = 5, endRow = 49, startCol = 1, endCol = 12 )
Both_Sexes <- na.omit(Both_Sexes)
Both_Sexes <- cbind(Both_Sexes, "Both Sexes")
colnames(Both_Sexes) <- Column_names
Both_Sexes<- cbind(Both_Sexes, Field_level1, Field_level2)

## Female
Female <- readWorksheetFromFile(temp, "sheet1", header = FALSE, startRow = 52, endRow = 96, startCol = 1, endCol = 12 )
Female <- na.omit(Female)
Female <- cbind(Female, "Female")
colnames(Female) <- Column_names
Female <- cbind(Female, Field_level1, Field_level2)

## Male
Male <- readWorksheetFromFile(temp, "sheet1", header = FALSE, startRow = 99, endRow = 143, startCol = 1, endCol = 12 )
Male <- na.omit(Male)
Male <- cbind(Male, "Male")
colnames(Male) <- Column_names
Male <- cbind(Male, Field_level1, Field_level2)

bachelors <- rbind(Both_Sexes, Female, Male)
rm(Both_Sexes, Female, Male, Column_names, Field_level1, Field_level2)


