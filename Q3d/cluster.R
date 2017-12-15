
# Loading Data
data<-read.csv("cluster_data.csv",header=TRUE)

# Creating model for K means with 2 clusters
kmeans_2<-kmeans(data[,-4],2)

# Creating model for K means with 3 clusters

kmeans_3<-kmeans(data[,-4],3)

# Creating model for K means with 4 clusters

kmeans_4<-kmeans(data[,-4],4)

# Creating model for K means with 5 clusters

kmeans_5<-kmeans(data[,-4],5)

# Creating model for K means with 6 clusters

kmeans_6<-kmeans(data[,-4],6)

# Computing total sum of squares cluster for k=2 :
total_ss_2<- kmeans_2$withinss[1]+kmeans_2$withinss[2]

# Computing total sum of squares cluster for k=3 :
total_ss_3<- kmeans_3$withinss[1]+kmeans_3$withinss[2]

# Computing total sum of squares cluster for k=4 :
total_ss_4<- kmeans_4$withinss[1]+kmeans_4$withinss[2]

# Computing total sum of squares cluster for k=5 :
total_ss_5<- kmeans_5$withinss[1]+kmeans_5$withinss[2]

# Computing total sum of squares cluster for k=6 :
total_ss_6<- kmeans_6$withinss[1]+kmeans_6$withinss[2]


total_ss<-c(total_ss_2,total_ss_3,total_ss_4,total_ss_5,total_ss_6)

k_values<-c(2,3,4,5,6)

#Plotting graph for this :

plot(k_values,total_ss,xlab="k",ylab="MSE",type="l",main="Number of Clusters vs Minimum Squared Error")

# From the graph, as per this data,elbow is created at k=3, so we will take 3 clusters in this case

# Class output for each sample with k=3 in K Means

kmeans_3$cluster



