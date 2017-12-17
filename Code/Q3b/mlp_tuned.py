from sklearn.neural_network import MLPClassifier
import pandas as pd
import numpy as np
from sklearn.metrics import accuracy_score
from sklearn import metrics

file = pd.read_csv('../Training_Dataset.csv', sep=',')
data = np.array(file.values[:, :3])
classes = file.Class


#the logistic sigmoid function, returns f(x) = 1 / (1 + exp(-x)).
clf = MLPClassifier(activation = 'logistic')
clf = MLPClassifier(activation = 'logistic', max_iter = 100000, learning_rate='constant', learning_rate_init=0.001, momentum=0.9)


clf.fit(data, classes)

test_file = pd.read_csv('../Test_Dataset.csv', sep=',')
test_data = np.array(test_file.values[:, :3])
test_classes = test_file.Class

predicted = clf.predict(test_data)

cm = metrics.confusion_matrix(test_classes, predicted)
accuracy = accuracy_score(test_classes, predicted)
print(accuracy)
print(cm)