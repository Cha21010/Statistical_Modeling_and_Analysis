📁 Project 1: Regression with Missing Data & Lack-of-Fit Testing
🔹 Part A – Handling Missing Data and Linear Regression
Objective:
To assess how the imputation of missing values affects the outcome of a linear regression model.

Methodology:

Merged independent (IV) and dependent (DV) variable datasets by ID.

Used the mice package in R to impute missing values using linear regression with bootstrapping.

Compared regression results before and after imputation.

Key Results:

Total observations: 508

Complete observations after cleaning: 483

Regression model after imputation:
Y = 3.180X + 46.163

95% CI for slope: [2.964, 3.397]
Adjusted R²: 0.634

Conclusion:
Imputation using bootstrap showed minimal impact on regression estimates compared to using only complete data.

🔹 Part B – Lack-of-Fit Test for a Transformed Model
Objective:
To determine if a significant lack of fit exists in the regression model after transformation.

Methodology:

Transformed DV to y^(-2/3) to address heteroscedasticity.

Grouped x using cut() and binned data.

Performed lack-of-fit test using pureErrorAnova() from alr3.

Model:
Y = 0.6496X + 12.0865
95% CI for slope: [0.5903, 0.7089]
Adjusted R²: 0.4447
LOF p-value: 0.07935 (not significant)

Conclusion:
No significant lack of fit detected. The model fits the data well under the transformed scale.

📁 Project 2: Multiple Regression with Variable Selection and Transformation
Objective:
To build a predictive model using environmental and genetic variables (E1–E4, G1–G20) and determine optimal transformation of the dependent variable Y.

Methodology:

Explored models using only environmental variables, then combined with genetic ones.

Performed Box-Cox transformation; selected λ = 1.1 for best homoscedasticity and fit.

Selected model based on R² and BIC comparisons.

Final model chosen:
Y^1.1 = 6.08 + 0.29*E1 + 0.62*E3 + 0.66*G8:G19 + ε

Results:

Raw model R²: 0.7191

Transformed model R²: 0.7206

Adjusted R²: 0.7198

Strong interaction effect from G8:G19 (t = 15.927)

Conclusion:
The final model with λ = 1.1 provided an improved fit. The selected variables E1, E3, G8, and G19 significantly explain the variation in Y.

🔧 Tools & Packages Used
R for data analysis and modeling

mice, alr3, knitr, and remotes R packages

CSV files for data input

Box-Cox transformation, LOF test, multiple regression, and variable selection techniques

