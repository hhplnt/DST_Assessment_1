# Introduction

The main aims of this project were to:

* Consider a classification problem
* Each create a model submission to be evaluated on left-out test data
* Compare our models according to a performance metric

As we are interested in cybersecurity applications, we chose to investigate the problem of predicting the attack type of instances in the KDD99 dataset called kddcup.data_10_percent.gz. This dataset...

* Description of data and why we chose the test set
* Performance metrics and why chosen

*For this problem, we want our false positive rate to be as low as possible. This is because normal traffic being dropped due to misclassification as a “bad” connection is less severe than a connection from an attack being misclassified as a “normal” connection, which may result in a security threat. 

In file 03, we explore methods for the binary classification problem of predicting normal vs non-normal instances, before moving on to the main multi-class problem we chose to consider for our individual models in files 04-06. Their performance is evaluated and conclusions are drawn in file 07.


This is a 3 person team; Hannah, Hailey and Jiang. Hannah has previous experience programming in R, whereas Jiang and Hailey have previous experience in Python. We decided to stick to these languages and divide the work accordingly. 
