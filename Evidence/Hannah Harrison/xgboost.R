install.packages('xgboost')
install.packages('archdata')
install.packages("Ckmeans.1d.dp")
library("xgboost")  # the main algorithm
library("archdata") # for the sample dataset
library("caret")    # for the confusionmatrix() function (also needs e1071 package)
library("dplyr")    # for some data preperation
library("Ckmeans.1d.dp") # for xgb.ggplot.importance



train <- kdd_10_train[,-42]

for (i in c(2,3,4, 42)){
  train[,i] = as.numeric(as.factor(train[,i]))
}
summary(train)

train$class = train$class - 1
summary(train)

#making xgboost matrix

data_label <- train[,"class"]
data_matrix <- xgb.DMatrix(data = as.matrix(train), label = data_label)

#CV
numberOfClasses <- length(unique(train$class))
xgb_params <- list("objective" = "multi:softprob",
                   "eval_metric" = "mlogloss",
                   "num_class" = numberOfClasses)
nround    <- 50 # number of XGBoost rounds
cv.nfold  <- 5

# Fit cv.nfold * cv.nround XGB models and save OOF predictions
cv_model <- xgb.cv(params = xgb_params,
                   data = data_matrix, 
                   nrounds = nround,
                   nfold = cv.nfold,
                   verbose = FALSE,
                   prediction = TRUE)

# Prediction
OOF_prediction <- data.frame(cv_model$pred) %>%
  mutate(max_prob = max.col(., ties.method = "last"),
         label = data_label + 1)
head(OOF_prediction)

confusionMatrix(factor(OOF_prediction$max_prob),
                factor(OOF_prediction$label),
                mode = "everything")