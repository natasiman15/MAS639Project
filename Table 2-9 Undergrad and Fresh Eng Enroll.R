library(XLConnect)

#Table 2-9
fname <- "C:/Users/Arwa/Downloads/tab2-9.xlsx"
sheet <- c("sheet1")
namedata <-readWorksheetFromFile(fname, sheet, header=FALSE, startRow=2, endRow=2, startCol=1, endCol=12)

UndergradEngEnroll<- readWorksheetFromFile(fname, sheet, header=FALSE, startRow=6, endRow=16, startCol=1, endCol=12)
colnames(UndergradEngEnroll)<-namedata
FreshEngEnroll<- readWorksheetFromFile(fname, sheet, header=FALSE, startRow=19, endRow=29, startCol=1, endCol=12)
colnames(FreshEngEnroll)<-namedata

#Table 2-9 undergrad engineering total enrollment and freshmen enrollment
UndergradEngEnroll
FreshEngEnroll
