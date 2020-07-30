



# divide into training and test data
salary_train <- read.csv('D:\\Data Science\\Excelr\\Assignments\\Assignment\\Support Vector Machines\\SalaryData_Train(1).csv')
salary_test  <- read.csv('D:\\Data Science\\Excelr\\Assignments\\Assignment\\Support Vector Machines\\SalaryData_Test(1).csv')

##Training a model on the data ----
# begin by training a simple linear SVM
library(kernlab)
salary_classifier <- ksvm(Salary ~ ., data = salary_train,
                          kernel = "vanilladot")
## Evaluating model performance ----
# predictions on testing dataset
salary_predictions <- predict(salary_classifier, salary_test)
head(salary_predictions)
#table(salary_predictions, salary_test$letter)
agreement <- salary_predictions == salary_test$Salary
prop.table(table(agreement))
## Improving model performance ----
salary_classifier_rbf <- ksvm(Salary ~ ., data = salary_train, kernel = "rbfdot")
salary_predictions_rbf <- predict(salary_classifier_rbf, salary_test)
head(salary_predictions_rbf)
agreement_rbf <- salary_predictions_rbf == salary_test$Salary
table(agreement_rbf)
prop.table(table(agreement_rbf))
