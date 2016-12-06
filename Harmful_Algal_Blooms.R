#Load Harmful Algal Bloom data. File pulled manually from http://sccoos.org/query/?project=Harmful%20Algal%20Blooms
#Data parameters = Harmul Algae Bloom; Cal Poly Pier; All; 15, Aug, 2008, 18 hour, 15 Minute; 28, Nov, 2015, 17 Hour, 33 Minute

HAB_Data <- read.csv(file ="HarmfulAlgalBlooms_2008_2016.csv", header = TRUE, sep = ",", na.strings = "NaN", skip = 7)

#inspect data
head(HAB_Data)
tail(HAB_Data)

# remove NA's
HAB_Data_Clean <- HAB_Data[complete.cases(HAB_Data),]

#load Caret pakage
library(caret)

#setup Test Options
control <- trainControl(method="repeatedcv", number=10, repeats=3)
seed <- 7

#set algorithm variables
metric <- "Accuracy"

#run algorithms

# Linear Discriminant Analysis
set.seed(seed)
fit.lda <- train(Domoic.Acid..ng.mL.~., data=HAB_Data_Clean, method="lda", metric=metric, preProc=c("center", "scale"), trControl=control)
