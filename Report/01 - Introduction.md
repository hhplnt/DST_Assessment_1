# Introduction

The main aims of this project were to:

* Consider a classification problem
* Each create a model submission to be evaluated on left-out test data
* Compare our models according to a performance metric

As we are interested in cybersecurity applications, we chose to investigate the problem of predicting the attack class of instances in the KDD99 dataset called kddcup.data_10_percent.gz. We use the ‘10%’ subset due to the huge amount of connection records present in the full set as we only have limited computational power. This dataset contains contains 494,021 records of 41 features, including  both numeric measurements such as the duration of the connection, and factors such as protocol type . The final column contains the label giving the type of attack or indicationg a normal connection. In this dataset there are 22 different types of attack, which would make the multi-class classification problem very difficult if we tried to predict the attack type. Hence we categorise the attacks into four classes, 'ddos', ‘probe’, ‘r2l’and ‘u2r’, as well as a normal category, and consider the 5 class problem of predicting which category an instance falls into. 

We decided to test our classifiers on both a small subset of the kddcup.data_10_percent.gz data, to see how the models fared on data from the same distribution as the training, as well as data from a different distibution, namely the labelled kdd test data. This set contains 311,029 records, speciﬁed as a set of instances of the same features with a diﬀerent distribution, and additional attacks not part of the training set.  In particular, it contains 37 diﬀerent attacks and so will test our models ability to recognise the class of attacks it hasn't seen before. Further, the sample distribution of ‘probe’, ‘r2l’and ‘u2r’ attacks varies strongly between the training set and the labelled test set, as we will see in file 07, and so it will be interesting to see how the models cope with this. 


In file 03, we explore methods for the binary classification problem of predicting normal vs non-normal instances, before moving on to the main multi-class problem we chose to consider for our individual models in files 04-06. Their performance is evaluated and conclusions are drawn in file 07. 

For this problem, we want our false positive rate to be as low as possible. This is because normal traffic being dropped due to misclassification as a “bad” connection is less severe than a connection from an attack being misclassified as a “normal” connection, which may result in a security threat. However, we also need to consider the comparitive rarity of attacks compared to normal connections, so we don't want the models to be alerting to attacks too frequently. Hence we test the models accordint to the following performance metrics:
1. Accuracy 
2. Precision for each attack type, as we want to consider the proportion of positive identifications that was actually correct
3. The recall (i.e. sensitivity) of less common attack classes in the test data (R2L, Probe and UR2)


This is a 3 person team; Hannah, Hailey and Jiang. Hannah has previous experience programming in R, whereas Jiang and Hailey have previous experience in Python. We decided to stick to these languages in order both to play to our strengths and investigate the tools available in both languages.
