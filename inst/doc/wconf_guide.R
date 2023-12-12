## ----setup, include = FALSE, echo=FALSE---------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  error = TRUE,
  comment = "#>"
)

## -----------------------------------------------------------------------------
# View the weight matrix and plot for a 3-category classification problem, using the arithmetic sequence option.

weightmatrix(3, weight.type = "arithmetic", plot.weights = TRUE)

## -----------------------------------------------------------------------------
# Load libraries and perform transformations
library(caret)
data(iris)
iris$Petal.Length.Cat = cut(iris$Petal.Length, breaks=c(1, 3, 5, 7), right = FALSE)

# Train multinomial logistic regression model using caret
set.seed(1)
control <- trainControl(method="repeatedcv", number=10, repeats=3)
model <- train(Petal.Length.Cat ~ Sepal.Width, data=iris, method="multinom", trace = FALSE, trControl=control)

# Extract original data, predicted values and place them in a table
y = iris$Petal.Length.Cat
yhat = predict(model)
preds = table(data=yhat, reference=y)

# Construct the confusion matrix
confmat = confusionMatrix(preds)

# Compute the weighted confusion matrix and display the weighted accuracy score
wconfusionmatrix(confmat, weight.type = "arithmetic", print.weighted.accuracy = TRUE)

