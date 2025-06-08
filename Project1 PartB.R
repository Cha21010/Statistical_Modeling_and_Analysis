data <- read.csv('/Users/ronghaozeng/Desktop/Project 1 Part B Data Files/069152_PartB.csv', header = TRUE)
data
data_trans <- data.frame(xtrans=data$x, ytrans=data$y^(-2/3))
data_trans
groups <- cut(data_trans$xtrans,breaks=c(-Inf,seq(min(data_trans$xtrans)+0.3, max(data_trans$xtrans)-0.3,by=0.3),Inf))
table(groups)
x <- ave(data_trans$xtrans, groups)
x
data_bin <- data.frame(x=x, y=data_trans$ytrans)
data_bin
install.packages('remotes')
library(remotes)
install_github("cran/alr3")
library(alr3)
fit_b <- lm(y ~ x, data = data_bin)
fit_b
pureErrorAnova(fit_b)
confint(fit_b, level = 0.99)
confint(fit_b, level = 0.95)
install.packages('knitr')
library(knitr)
kable(anova(fit_b), caption='ANOVA Table')


