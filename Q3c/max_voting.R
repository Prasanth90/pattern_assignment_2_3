test_dataset<-read.csv("Test_Dataset.csv",header=TRUE)

actual_data<-matrix(c(test_dataset$Class),ncol=1)

pnn_predicted<-source('Q3b/pnn_tuned.R')
print("Predicting with PNN Classifier")
print(pnn_predicted$value)



knn_predicted<-source('Q3b/KNN_tuned.R')
print("Predicting with KNN Classifier")
print(knn_predicted$value)


svm_predicted<-source('Q3b/svm_tuned.R')
print("Predicting with SVM Classifier")
print(svm_predicted$value)


max_voted_output<-c()

for(i in 1:30) {
  #print("Max Voting")
  combined_output = c(pnn_predicted$value[i], knn_predicted$value[i], svm_predicted$value[i])
  fin_val<-names(which(table(combined_output) == max(table(combined_output))))
  #print("fin_val")
  #print(fin_val)
  if(fin_val[1] == "1") 
  {
    max_voted_output[i] = 1
  }
  else if(fin_val[1] == "2") {
    max_voted_output[i] = 2
  }
  else
  {
    max_voted_output[i] = 3 
  }
}

print(max_voted_output)

max_voted_cm <-table(actual_data, max_voted_output)

print(max_voted_cm)