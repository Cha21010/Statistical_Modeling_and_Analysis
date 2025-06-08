PartA_DV <- read.csv('/Users/ronghaozeng/Desktop/Undergraduate/Spring2022/AMS315/Project 1 Part A Data Files/DV1.csv', header=TRUE)
PartA_DV
PartA_IV <- read.csv('/Users/ronghaozeng/Desktop/Undergraduate/Spring2022/AMS315/Project 1 Part A Data Files/IV1.csv', header=TRUE)
PartA_IV
PartA <- merge(PartA_IV, PartA_DV, by = 'ID')
PartA
any(is.na(PartA[,2]))
any(is.na(PartA[,3]))
install.packages('mice')
library(mice)
PartA_incomplete <- PartA
# patterns of the table of missing value
md.pattern(PartA_incomplete)
PartA_imp <- PartA[!is.na(PartA$IV)==TRUE|!is.na(PartA$DV)==TRUE,]
PartA_imp
imp <- mice(PartA_imp,method="norm.predict", seed=123)
PartA_complete <- complete(imp)
PartA_complete
M <- lm(DV ~ IV, data=PartA_complete)
summary(M)
PartA_imp1 <- PartA[!is.na(PartA$IV)==TRUE&!is.na(PartA$DV)==TRUE,]
PartA_imp1
M1 <- lm(DV ~ IV, data=PartA_imp1)
M1
summary(M1)
confint(M, level = 0.95)
confint(M, level = 0.99)
install.packages('knitr')
library(knitr)
kable(anova(M), caption='ANOVA Table')
