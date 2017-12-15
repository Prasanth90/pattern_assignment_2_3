library(rgl)
library(scatterplot3d)
library(class)



#knn.reg(train.traindataset,test.testdataset,k=3)
Accuracy<-function(){
  actual<-test.def
  #print(actual)
  prediction<-unlist(pred_data[,4])
  #print(length(prediction))
  knn_cm<-table(actual,prediction)
  print(knn_cm)
  return(knn_cm)
}

traindataset <- read.csv("Training_Dataset.csv")
head (traindataset)

testdataset <- read.csv("Test_Dataset.csv")
head (testdataset)

traindataset.bkup <- traindataset
testdataset.bkup<-testdataset

## Convert the dependent var to factor. Normalize the numeric variables  
traindataset$Class <- factor(traindataset$Class)
num.vars <- sapply(traindataset, is.numeric)
traindataset[num.vars] <- lapply(traindataset[num.vars], scale)
par(mar = rep(2, 4))

## Convert the dependent var to factor. Normalize the numeric variables  
testdataset$Class <- factor(testdataset$Class)
num.vars1 <- sapply(testdataset, is.numeric)
testdataset[num.vars1] <- lapply(testdataset[num.vars1], scale)
par(mar = rep(2, 4))


## Selecting only 3 features 
myvars <- c("X1", "X2", "X3")
traindataset.subset <- traindataset[myvars]
testdataset.subset<-testdataset[myvars]

summary(traindataset.subset)
summary(testdataset.subset)

#test <- 1:400
train.traindataset <- traindataset.subset
test.testdataset <- testdataset.subset

train.def <- traindataset$Class
test.def <- testdataset$Class

#Fit method

knn.3 <-  knn(train.traindataset, test.testdataset, train.def, k=3)
knn.5 <- knn(train.traindataset, test.testdataset, train.def, k=5)

#Improvements
knn.1 <-  knn(train.traindataset, test.testdataset, train.def, k=1)

s<-scatterplot3d(train.traindataset[,c("X1", "X2", "X3")],
color=c('black','red', 'blue')[as.numeric(train.def)],pch=c(21,24,19)[as.numeric(train.def)],
xlim=c(-10,10),
ylim=c(-10,10),
zlim=c(-10,10), main = "KNN - 3D Scatter Plot for Features with Classification")
s$points3d(test.testdataset[,c("X1", "X2", "X3")],col=c('green','pink','steelblue')[as.numeric(knn.1)],pch=c(21,24,19)[as.numeric(knn.3)])


pred_data<-data.frame(test.testdataset,pred=knn.1)
#print(pred_data[,4])
#print(test.def)
knn_cm<-Accuracy()

#par(mfrow=c(1,2))
#bar_plot(knn_cm,"KNN - Accuracy of classifier using Test data")
#bar_plot(knn_cm,"KNN ALGORITHM CLASSIFICATION FOR TEST DATA")
return(unlist(pred_data[,4]))
