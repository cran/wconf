# wconf 1.2.0

New function: "rconfusionmatrix" - allows for a new way of calculating
weighted accuracy metrics, by reallocating observations classified in the
vicinity of the true category to the confusion matrix diagonal.

Bugfix: The "wconfusionmatrix" weighting calculation is adjusted to fix a rare
bug which would appear when selecting a specific set of weights.

Improvements: Vignette updated to include additional examples and improvements
in formatting and display of results.

# wconf 1.1.0

New function: "balancedaccuracy" - implements the Starovoitov-Golub sine-based
accuracy metrics, specifically designed for classification with imbalanced data.

New features: the "wconfusionmatrix" and "weightmatrix" functions now include
two additional weighting schemes "sin" and "tanh" - based on the sinus and
hyperbolic tangent functions, which allow for even greater customization of
weights assigned to classes.

Bugfix: The "interval" weighting scheme under the "wconfusionmatrix" and
"weightmatrix" functions has been fixed. It previously produced inaccurate
results when run with matrix dimensions greater than 5.

Improvements: Vignette updated to include additional examples and improvements
in formatting and display of results.

# wconf 1.0.0

This is the initial release.
