library(XLConnect)

#Table 9-13
fname <- "C:/Users/Arwa/Downloads/tab9-13.xlsx"
sheet <- c("sheet1")
namedata <-readWorksheetFromFile(fname, sheet, header=FALSE, startRow=2, endRow=2, startCol=1, endCol=7)

All <- readWorksheetFromFile(fname, sheet, header=FALSE, startRow=4, endRow=6, startCol=1, endCol=7)
colnames(All)<-namedata
Science<-readWorksheetFromFile(fname, sheet, header=FALSE, startRow=13, endRow=15, startCol=1, endCol=7)
colnames(Science)<-namedata  
BioScience<-readWorksheetFromFile(fname, sheet, header=FALSE, startRow=22, endRow=24, startCol=1, endCol=7)
colnames(BioScience)<-namedata  
ComputerSci<-readWorksheetFromFile(fname, sheet, header=FALSE, startRow=31, endRow=33, startCol=1, endCol=7)
colnames(ComputerSci)<-namedata
MathSci<-readWorksheetFromFile(fname, sheet, header=FALSE, startRow=40, endRow=42, startCol=1, endCol=7)
colnames(MathSci)<-namedata 
PhysSci<-readWorksheetFromFile(fname, sheet, header=FALSE, startRow=49, endRow=51, startCol=1, endCol=7)
colnames(PhysSci)<-namedata 
Psychology<-readWorksheetFromFile(fname, sheet, header=FALSE, startRow=58, endRow=60, startCol=1, endCol=7)
colnames(Psychology)<-namedata 
SocSci<-readWorksheetFromFile(fname, sheet, header=FALSE, startRow=67, endRow=69, startCol=1, endCol=7)
colnames(SocSci)<-namedata 
Engineering<-readWorksheetFromFile(fname, sheet, header=FALSE, startRow=76, endRow=78, startCol=1, endCol=7)
colnames(Engineering)<-namedata
Health<-readWorksheetFromFile(fname, sheet, header=FALSE, startRow=85, endRow=87, startCol=1, endCol=7)
colnames(Health)<-namedata

#tables for Science and Engineering fields for females and males
All
Science
BioScience
ComputerSci
MathSci
PhysSci
Psychology
SocSci
Engineering
Health

