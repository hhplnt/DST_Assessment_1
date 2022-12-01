install.packages('e1071')
library(e1071)

# Build the model
label_result = kdd_10_train$class
train_features = kdd_10_train[ ,1:41]
naive_bayes_tree_model = naiveBayes(as.factor(label_result)~.,
                                    train_features)

# Prediction

naive_bayes_pred = predict(navie_bayes_tree_model, train_features)

# Get the accuracy
NB_accuracy <- mean(label_result == naive_bayes_pred,na.rm = TRUE)
NB_accuracy


cm2 <- confusionMatrix(as.factor(naive_bayes_pred),
                       as.factor(label_result))

# Print accuracy
cm2$overall["Accuracy"]
cm2
# Stats not so good for R2L; makes sense as this is the smallest class

