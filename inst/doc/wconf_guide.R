## ----setup, include = FALSE, echo=FALSE---------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  error = TRUE,
  comment = "#>"
)

## -----------------------------------------------------------------------------
library(wconf)

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

## ----echo=FALSE---------------------------------------------------------------
mtx = t(matrix(
  c(20, 0, 2, 1,
    0, 34, 23, 7,
    0, 0,  5, 3,
    0, 0,  5, 1),
  nrow = 4))
mtx

## -----------------------------------------------------------------------------
rmtx = rconfusionmatrix(mtx, custom.weight = c(0, 0.5, 0.1, 0), print.weighted.accuracy = TRUE)
rmtx

## -----------------------------------------------------------------------------
wmtx = wconfusionmatrix(mtx, weight.type = "custom", custom.weight = c(1, 0.5, 0.1, 0), print.weighted.accuracy = TRUE)
wmtx

## -----------------------------------------------------------------------------
balancedaccuracy(rmtx)

## ----echo=FALSE---------------------------------------------------------------
mtx = t(matrix(
  c(50, 0, 118, 5,
    0,  1,  45, 27,
    0, 84,  22, 1,
    0, 22,  57, 4),
  nrow = 4))
mtx

## -----------------------------------------------------------------------------
balancedaccuracy(mtx)

## -----------------------------------------------------------------------------
mtx = t(matrix(
  c(50, 0, 118, 5,
    0, 1, 45, 27,
    0, 84, 22, 1,
    0, 22, 57, 70),
  nrow = 4))

balancedaccuracy(mtx)

## ----echo=FALSE---------------------------------------------------------------
mtx = t(matrix(
  c(5000, 0, 118, 5,
    0,  1,  45, 27,
    0, 84,  22, 1,
    0, 22,  57, 4),
  nrow = 4))

## -----------------------------------------------------------------------------
balancedaccuracy(mtx)

