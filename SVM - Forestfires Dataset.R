


forestfires_r <- read.csv('D:\\Data Science\\Excelr\\Assignments\\Assignment\\Support Vector Machines\\forestfires_r.csv')

# divide into training and test data
forestfires_train <- forestfires_r[1:354, ]
forestfires_test  <- forestfires_r[355:517, ]

##Training a model on the data ----
# begin by training a simple linear SVM
library(kernlab)
size_classifier <- ksvm(size_category ~ ., data = forestfires_train,
                          kernel = "vanilladot")
## Evaluating model performance ----
# predictions on testing dataset
size_predictions <- predict(size_classifier, forestfires_test)
head(size_predictions)
#table(forestfires_predictions, forestfires_test$letter)
agreement <- size_predictions == forestfires_test$size_category
prop.table(table(agreement))
## Improving model performance ----
size_classifier_rbf <- ksvm(size_category ~ ., data = forestfires_train, kernel = "rbfdot")
size_predictions_rbf <- predict(size_classifier_rbf, forestfires_test)
head(size_predictions_rbf)
agreement_rbf <- size_predictions_rbf == forestfires_test$size_category
table(agreement_rbf)
prop.table(table(agreement_rbf))
