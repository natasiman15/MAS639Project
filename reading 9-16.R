# Read in data
#install.packages("xlsx")
#setwd("/Users/natasiman15/Dropbox/Business Analytics Master/Classes/MAS 639/")
#download.file(link, temp, method = "curl")
#file_name = "median_salary.xlsx"


require(XLConnect)
link <- "http://www.nsf.gov/statistics/2015/nsf15311/tables/tab9-16.xlsx"
temp <- tempfile()
download.file(link,temp, method = "curl")

n = 8

names = c("Age","All Degrees - Both", "All Degrees-Female", "All Degrees - Male", "Bachelors - Both", "Bachelors - Female", "Bachelors- Male", "Masters - Both", "Masters-Female", "Masters- Male", "Doctorate - Both", "Doctorate - Female", "Doctorate - Male", "Occupation")

allOccupations <- readWorksheetFromFile(temp, "sheet1", header = FALSE, startRow = n, endRow = n+3, startCol = 1, endCol = 16 )
rownames(allOccupations) <- paste("All Occupations",allOccupations$Col1, sep = " - ")
allOccupations <- subset(allOccupations, select = -c(Col5,Col9,Col13))
allOccupations <- cbind(allOccupations, "All Occupations")
colnames(allOccupations) <- names
n=n+6


allSE <- readWorksheetFromFile(temp, "sheet1", header = FALSE, startRow = n, endRow = n+3, startCol = 1, endCol = 16 )
rownames(allSE) <- paste("All S&E",allSE$Col1, sep = " - ")
allSE <- subset(allSE, select = -c(Col5,Col9,Col13))
allSE <- cbind(allSE, "All S&E")
colnames(allSE) <- names
n = n+6

Science <- readWorksheetFromFile(temp, "sheet1", header = FALSE, startRow = n, endRow = n+3, startCol = 1, endCol = 16 )
rownames(Science) <- paste("Science",Science$Col1, sep = " - ")
Science <- subset(Science, select = -c(Col5,Col9,Col13))
Science <- cbind(Science, "Science Occupations")
colnames(Science) <- names
n = n+6

Bio_life <- readWorksheetFromFile(temp, "sheet1", header = FALSE, startRow = n, endRow = n+3, startCol = 1, endCol = 16 )
rownames(Bio_life) <- paste("Bio and life",Bio_life$Col1, sep = " - ")
Bio_life <- subset(Bio_life, select = -c(Col5,Col9,Col13))
Bio_life <- cbind(Bio_life, "Biological/life Scientist")
colnames(Bio_life) <- names
n=n+6

CIS <- readWorksheetFromFile(temp, "sheet1", header = FALSE, startRow = n, endRow = n+3, startCol = 1, endCol = 16 )
rownames(CIS) <- paste("CIS",CIS$Col1, sep = " - ")
CIS <- subset(CIS, select = -c(Col5,Col9,Col13))
CIS <- cbind(CIS, "Computer and Information Scientist")
colnames(CIS) <- names
n=n+6

Math <- readWorksheetFromFile(temp, "sheet1", header = FALSE, startRow = n, endRow = n+3, startCol = 1, endCol = 16 )
rownames(Math) <- paste("Math",Math$Col1, sep = " - ")
Math <- subset(Math, select = -c(Col5,Col9,Col13))
Math <- cbind(Math, "Mathematical Scientist")
colnames(Math) <- names
n=n+6

Phys_sci <- readWorksheetFromFile(temp, "sheet1", header = FALSE, startRow = n, endRow = n+3, startCol = 1, endCol = 16 )
rownames(Phys_sci) <- paste("Physical",Phys_sci$Col1, sep = " - ")
Phys_sci <- subset(Phys_sci, select = -c(Col5,Col9,Col13))
Phys_sci <- cbind(Phys_sci, "Physical Scientist")
colnames(Phys_sci) <- names
n=n+6

Psycho <- readWorksheetFromFile(temp, "sheet1", header = FALSE, startRow = n, endRow = n+3, startCol = 1, endCol = 16 )
rownames(Psycho) <- paste("Psychologist",Psycho$Col1, sep = " - ")
Psycho <- subset(Psycho, select = -c(Col5,Col9,Col13))
Psycho <- cbind(Psycho, "Psychologist")
colnames(Psycho) <- names
n=n+6

Social <- readWorksheetFromFile(temp, "sheet1", header = FALSE, startRow = n, endRow = n+3, startCol = 1, endCol = 16 )
rownames(Social) <- paste("Social",Social$Col1, sep = " - ")
Social <- subset(Social, select = -c(Col5,Col9,Col13))
Social <- cbind(Social, "Social Scientist")
colnames(Social) <- names
n=n+6

Eng <- readWorksheetFromFile(temp, "sheet1", header = FALSE, startRow = n, endRow = n+3, startCol = 1, endCol = 16 )
rownames(Eng) <- paste("Engineering",Eng$Col1, sep = " - ")
Eng <- subset(Eng, select = -c(Col5,Col9,Col13))
Eng <- cbind(Eng, "Engineering")
colnames(Eng) <- names
n=n+6

SERel <- readWorksheetFromFile(temp, "sheet1", header = FALSE, startRow = n, endRow = n+3, startCol = 1, endCol = 16 )
rownames(SERel) <- paste("S&E Related",SERel$Col1, sep = " - ")
SERel <- subset(SERel, select = -c(Col5,Col9,Col13))
SERel <- cbind(SERel, "S&E Related")
colnames(SERel) <- names
n=n+6

Non_SE <- readWorksheetFromFile(temp, "sheet1", header = FALSE, startRow = n, endRow = n+3, startCol = 1, endCol = 16 )
rownames(Non_SE) <- paste("Non - S&E Occupations",Non_SE$Col1, sep = " - ")
Non_SE <- subset(Non_SE, select = -c(Col5,Col9,Col13))
Non_SE <- cbind(Non_SE, "Non - S&E Occupations")
colnames(Non_SE) <- names
n=n+6


salary_data <- rbind(allOccupations, allSE, Science, Bio_life, CIS, Math, Phys_sci, Psycho, Social, Eng, SERel, Non_SE)
rm(allOccupations, allSE, Science, Bio_life, CIS, Math, Phys_sci, Psycho, Social, Eng, SERel, Non_SE)
salary_data
