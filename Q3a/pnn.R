library(pnn)

dataset<-read.csv("Training_Dataset.csv",header=TRUE)

print("Training the PNN Classifier")

pnn<-learn(dataset, category.column = 4)

pnn <- smooth(pnn)
pnn$sigma

pnn$model

print("Classes Found")
print(pnn$categories)


test_dataset<-read.csv("Test_Dataset.csv",header=TRUE)

actual<-matrix(c(test_dataset$Class),ncol=1)

## Taking columns  as features
x<-matrix(c(test_dataset$X1,test_dataset$X2,test_dataset$X3),ncol=3)

output <- c()

for (i in 1:30) {
  val<-guess(pnn, x[i,])
  if(val$category == "1") 
  {
    output[i] = 1
  }
  else if(val$category == "2") {
    output[i] = 2
  }
  else
  {
    output[i] = 3 
  }
}

print(output)

cm<-table(output, actual)

print(cm)

return(output)