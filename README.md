# wconf <img src="man/figures/logo.png" align="right" height="136" />

## Weighted Confusion Matrix

### **wconf** is a package that allows users to create weighted confusion matrices and accuracy metrics that help with the model selection process for classification problems, where distance from the correct category is important.

The package includes several weighting schemes which can be parameterized, as well as custom configuration options. Furthermore, users can decide whether they wish to positively or negatively affect the accuracy score as a result of applying weights to the confusion matrix. "wconf" integrates well with the "caret" package, but it can also work standalone when provided data in matrix form.

Applying a weighting scheme to the confusion matrix can be useful in applications such as performance evaluation, where characteristics such as "underperforming", "acceptable", "overperforming" and "worker of the year" may represent gradations that are far apart and unevenly spaced. Similarly, where the objective is to classify geographic regions and proximity of the prediction to the actual region constitutes an advantage in terms of the model’s performance, applying a weighting scheme facilitates the model selection process.

Functions are included to calculate accuracy metrics for imbalanced data. Specifically, the package
allows users to compute the Starovoitov-Golub sine-accuracy function, as well as the balanced accuracy
function and the standard accuracy indicator.

### [Paper (ResearchGate)](http://dx.doi.org/10.13140/RG.2.2.15992.83207)

### [Paper (SSRN)](http://dx.doi.org/10.2139/ssrn.4802336)

### v1.2.0

## About wconf

**wconf** consists of the following functions:

### weightmatrix - configure and visualize a weight matrix
This function allows users to choose from different weighting schemes and experiment with parametrizations and custom configurations.

**weightmatrix(_n_, _weight.type_, _weight.penalty_, _standard.deviation_, _geometric.multiplier_, _interval.high_, _interval.low_, _custom.weights_, _plot.weights_)**

_n_	–	the number of classes contained in the confusion matrix.

_weight.type_	–	the weighting schema to be used. Can be one of:
"arithmetic" - a decreasing arithmetic progression weighting scheme,
"geometric" - a decreasing geometric progression weighting scheme,
"normal" - weights drawn from the right tail of a normal distribution,
"interval" - weights contained on a user-defined interval,
"custom" - custom weight vector defined by the user.

_weight.penalty_	–	determines whether the weights associated with non-diagonal elements generated by the "normal", "arithmetic" and "geometric" weight types are positive or negative values. By default, the value is set to FALSE, which means that generated weights will be positive values.

_standard.deviation_	–	standard deviation of the normal distribution, if the normal distribution weighting schema is used.

_geometric.multiplier_	–	the multiplier used to construct the geometric progression series, if the geometric progression weighting scheme is used.

_interval.high_	–	the upper bound of the weight interval, if the interval weighting scheme is used.

_interval.low_	–	the lower bound of the weight interval, if the interval weighting scheme is used.

_custom.weights_ – the vector of custom weights to be applied, is the custom weighting scheme was selected. The vector should be equal to "n", but can be larger, with excess values being ignored.

_plot.weights_ – optional setting to enable plotting of weight vector, corresponding to the first column of the weight matrix

### wconfusionmatrix - compute a weighted confusion matrix
This function calculates the weighted confusion matrix by multiplying, element-by-element, a weight matrix with a supplied confusion matrix object.

**wconfusionmatrix(_m_, _weight.type_, _weight.penalty_, _standard.deviation_, _geometric.multiplier_, _interval.high_, _interval.low_, _custom.weights_, _print.weighted.accuracy_)**

_m_	–	the caret confusion matrix object or simple matrix.

_weight.type_	–	the weighting schema to be used. Can be one of:
"arithmetic" - a decreasing arithmetic progression weighting scheme,
"geometric" - a decreasing geometric progression weighting scheme,
"normal" - weights drawn from the right tail of a normal distribution,
"interval" - weights contained on a user-defined interval,
"custom" - custom weight vector defined by the user.

_weight.penalty_	–	determines whether the weights associated with non-diagonal elements generated by the "normal", "arithmetic" and "geometric" weight types are positive or negative values. By default, the value is set to FALSE, which means that generated weights will be positive values.

_standard.deviation_	–	standard deviation of the normal distribution, if the normal distribution weighting schema is used.

_geometric.multiplier_	–	the multiplier used to construct the geometric progression series, if the geometric progression weighting scheme is used.

_interval.high_	–	the upper bound of the weight interval, if the interval weighting scheme is used.

_interval.low_	–	the lower bound of the weight interval, if the interval weighting scheme is used.

_custom.weights_ – the vector of custom weights to be applied, is the custom weighting scheme was selected. The vector should be equal to "n", but can be larger, with excess values being ignored.

_print.weighted.accuracy_ – optional setting to print the weighted accuracy metric, which represents the sum of all weighted confusion matrix cells divided by the total number of observations.

### rconfusionmatrix - compute a redistributed confusion matrix
This function calculates the redistributed confusion matrix by reallocating observations classified in the vicinity of the true category to the confusion matrix diagonal, according to a user-specified weighting scheme which determines the proportion of observations to reassign.

**rconfusionmatrix(_m_, _custom.weights_, _print.weighted.accuracy_)**

_m_	–	the caret confusion matrix object or simple matrix.

_custom.weights_ – the vector of custom weights to be applied. The vector should be equal to "n", but can be larger, with the first value and all excess values being ignored.

_print.weighted.accuracy_ – optional setting to print the standard redistributed accuracy metric, which represents the sum of all observations on the diagonal divided by the total number of observations.

### balancedaccuracy - calculate accuracy scores for imbalanced data
This function calculates classification accuracy scores using the sine-based
formulas proposed by Starovoitov and Golub (2020). The advantage of the new
method consists in producing improved results when compared with the standard
balanced accuracy function, by taking into account the class distribution of
errors. This feature renders the method useful when confronted with imbalanced
data.

**balancedaccuracy(_m_, _print.scores_)**

The function takes as input:

_m_ - the caret confusion matrix object or simple matrix.

_print.scores_ - used to display the accuracy scores when set to TRUE.

## Technical details

For custom specifications, since the interval of variation of the weights is not bound to any given interval, depending on the user configuration, it is possible to obtain negative accuracy scores.

## Download and installation of development version

#### Online, from Github:

You can download **wconf** directly from Github. To do so, you need to have the **devtools** package installed and loaded. Once you are in **R**, run the following commands:

> install.packages("devtools")
>
> library("devtools")
>
> install_github("alexandrumonahov/wconf")

You may face downloading errors from Github if you are behind a firewall or there are https download restrictions. To avoid this, you can try running the following commands:

> options(download.file.method = "libcurl")
>
> options(download.file.method = "wininet")

Once the package is installed, you can run it using the: **library(wconf)** command.

## Author details

Alexandru Monahov, 2024

