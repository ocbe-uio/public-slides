---
title: Answer key to R workshop exercises
author: Waldir Leoncio
date: "2021-09-22"
output:
  html_document:
    toc: true
---

# Exercise!


```r
print('Hello, world!')
```

```
## [1] "Hello, world!"
```

# Work it!


```r
ToothGrowth
```

```
##     len supp dose
## 1   4.2   VC  0.5
## 2  11.5   VC  0.5
## 3   7.3   VC  0.5
## 4   5.8   VC  0.5
## 5   6.4   VC  0.5
## 6  10.0   VC  0.5
## 7  11.2   VC  0.5
## 8  11.2   VC  0.5
## 9   5.2   VC  0.5
## 10  7.0   VC  0.5
## 11 16.5   VC  1.0
## 12 16.5   VC  1.0
## 13 15.2   VC  1.0
## 14 17.3   VC  1.0
## 15 22.5   VC  1.0
## 16 17.3   VC  1.0
## 17 13.6   VC  1.0
## 18 14.5   VC  1.0
## 19 18.8   VC  1.0
## 20 15.5   VC  1.0
## 21 23.6   VC  2.0
## 22 18.5   VC  2.0
## 23 33.9   VC  2.0
## 24 25.5   VC  2.0
## 25 26.4   VC  2.0
## 26 32.5   VC  2.0
## 27 26.7   VC  2.0
## 28 21.5   VC  2.0
## 29 23.3   VC  2.0
## 30 29.5   VC  2.0
## 31 15.2   OJ  0.5
## 32 21.5   OJ  0.5
## 33 17.6   OJ  0.5
## 34  9.7   OJ  0.5
## 35 14.5   OJ  0.5
## 36 10.0   OJ  0.5
## 37  8.2   OJ  0.5
## 38  9.4   OJ  0.5
## 39 16.5   OJ  0.5
## 40  9.7   OJ  0.5
## 41 19.7   OJ  1.0
## 42 23.3   OJ  1.0
## 43 23.6   OJ  1.0
## 44 26.4   OJ  1.0
## 45 20.0   OJ  1.0
## 46 25.2   OJ  1.0
## 47 25.8   OJ  1.0
## 48 21.2   OJ  1.0
## 49 14.5   OJ  1.0
## 50 27.3   OJ  1.0
## 51 25.5   OJ  2.0
## 52 26.4   OJ  2.0
## 53 22.4   OJ  2.0
## 54 24.5   OJ  2.0
## 55 24.8   OJ  2.0
## 56 30.9   OJ  2.0
## 57 26.4   OJ  2.0
## 58 27.3   OJ  2.0
## 59 29.4   OJ  2.0
## 60 23.0   OJ  2.0
```

```r
(Tooth_OJ_1plus <- ToothGrowth[ToothGrowth$supp == 'OJ' & ToothGrowth$dose >= 1, ])
```

```
##     len supp dose
## 41 19.7   OJ    1
## 42 23.3   OJ    1
## 43 23.6   OJ    1
## 44 26.4   OJ    1
## 45 20.0   OJ    1
## 46 25.2   OJ    1
## 47 25.8   OJ    1
## 48 21.2   OJ    1
## 49 14.5   OJ    1
## 50 27.3   OJ    1
## 51 25.5   OJ    2
## 52 26.4   OJ    2
## 53 22.4   OJ    2
## 54 24.5   OJ    2
## 55 24.8   OJ    2
## 56 30.9   OJ    2
## 57 26.4   OJ    2
## 58 27.3   OJ    2
## 59 29.4   OJ    2
## 60 23.0   OJ    2
```

```r
dim(Tooth_OJ_1plus)
```

```
## [1] 20  3
```

# Pie


```r
?pie
```

> Pie charts are a very bad way of displaying information.  The eye
> is good at judging linear measures and bad at judging relative
> areas.  A bar chart or dot chart is a preferable way of displaying
> this type of data.

# Bonus round


```r
rm(list = ls())
rm(list = ls(all.names = TRUE))
```

# Exercise with trees


```r
summary(trees)
```

```
##      Girth           Height       Volume     
##  Min.   : 8.30   Min.   :63   Min.   :10.20  
##  1st Qu.:11.05   1st Qu.:72   1st Qu.:19.40  
##  Median :12.90   Median :76   Median :24.20  
##  Mean   :13.25   Mean   :76   Mean   :30.17  
##  3rd Qu.:15.25   3rd Qu.:80   3rd Qu.:37.30  
##  Max.   :20.60   Max.   :87   Max.   :77.00
```

```r
plot(trees)
```

<img src="answerKey_files/figure-html/trees-1.png" width="672" />

```r
lm(Height ~ Girth + Volume, data = trees)
```

```
## 
## Call:
## lm(formula = Height ~ Girth + Volume, data = trees)
## 
## Coefficients:
## (Intercept)        Girth       Volume  
##     83.2958      -1.8615       0.5756
```

# Back to the Guinea pigs

## Growth by supplement

```r
boxplot(len ~ supp, data = ToothGrowth)
```

<img src="answerKey_files/figure-html/guinea_pigs_supp-1.png" width="672" />

```r
Tooth_OJ <- ToothGrowth[ToothGrowth$supp == 'OJ', ]
Tooth_VC <- ToothGrowth[ToothGrowth$supp == 'VC', ]
t.test(Tooth_OJ$len, Tooth_VC$len)
```

```
## 
## 	Welch Two Sample t-test
## 
## data:  Tooth_OJ$len and Tooth_VC$len
## t = 1.9153, df = 55.309, p-value = 0.06063
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##  -0.1710156  7.5710156
## sample estimates:
## mean of x mean of y 
##  20.66333  16.96333
```

## Growth by dosage

```r
boxplot(len ~ dose, data = ToothGrowth)
```

<img src="answerKey_files/figure-html/guinea_pigs_dose-1.png" width="672" />

```r
Tooth_d05 <- ToothGrowth[ToothGrowth$dose == 0.5, ]
Tooth_d10 <- ToothGrowth[ToothGrowth$dose == 1.0, ]
Tooth_d20 <- ToothGrowth[ToothGrowth$dose == 2.0, ]
t.test(Tooth_d05$len, Tooth_d10$len)
```

```
## 
## 	Welch Two Sample t-test
## 
## data:  Tooth_d05$len and Tooth_d10$len
## t = -6.4766, df = 37.986, p-value = 1.268e-07
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##  -11.983781  -6.276219
## sample estimates:
## mean of x mean of y 
##    10.605    19.735
```

```r
t.test(Tooth_d05$len, Tooth_d20$len)
```

```
## 
## 	Welch Two Sample t-test
## 
## data:  Tooth_d05$len and Tooth_d20$len
## t = -11.799, df = 36.883, p-value = 4.398e-14
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##  -18.15617 -12.83383
## sample estimates:
## mean of x mean of y 
##    10.605    26.100
```

```r
t.test(Tooth_d10$len, Tooth_d20$len)
```

```
## 
## 	Welch Two Sample t-test
## 
## data:  Tooth_d10$len and Tooth_d20$len
## t = -4.9005, df = 37.101, p-value = 1.906e-05
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##  -8.996481 -3.733519
## sample estimates:
## mean of x mean of y 
##    19.735    26.100
```

# A couple extra exercises

## Subsetting (`esoph` dataset)


```r
# Conditions
age65plus <- esoph$agegp == '65-74' | esoph$agegp == '75+'
minalc    <- esoph$alcgp == '0-39g/day'
mintob    <- esoph$tobgp == '0-9g/day'
maxalc    <- esoph$alcgp == '120+'
maxtob    <- esoph$tobgp == '30+'

# Datasets
e1 <- esoph[age65plus & minalc & mintob, 'ncases']
e2 <- esoph[maxalc | maxtob, 'ncases']
e3 <- esoph[maxalc & maxtob, 'ncases']
e4 <- esoph[!(maxalc | maxtob), 'ncases']

# Results
sapply(list(e1, e2, e3, e4), sum) # same applying sum() on each dataset
```

```
## [1]   6  66  10 134
```

## Plotting

```r
set.seed(453)
x <- rpois(100, lambda=10)
table(x)
```

```
## x
##  3  4  5  6  7  8  9 10 11 12 13 14 16 17 18 19 
##  1  4  2  4 10 15  6 17 10  5 12  8  2  2  1  1
```

```r
plot(table(x))
abline(v=mean(x), col='red')
```

<img src="answerKey_files/figure-html/plotting-extra-1.png" width="672" />

# Reading and saving data


```r
x <- 1:10
save(x, file = 'x.rda')
saveRDS(x, file = 'x.rds')
rm(list=ls()) # same effect as restarting R, for this exercise
readRDS('x.rds')
```

```
##  [1]  1  2  3  4  5  6  7  8  9 10
```

```r
ls()
```

```
## character(0)
```

```r
load('x.rda')
ls()
```

```
## [1] "x"
```

# dplyr


```r
library(dplyr)
```

```
## 
## Attaching package: 'dplyr'
```

```
## The following objects are masked from 'package:stats':
## 
##     filter, lag
```

```
## The following objects are masked from 'package:base':
## 
##     intersect, setdiff, setequal, union
```

```r
vroom <- mutate(mtcars,
	wt  = wt / 0.4536,
	kpl = mpg * 0.4251
)
identical(vroom, within(mtcars, {wt <- wt / 0.4536; kpl <- mpg * 0.4251}))
```

```
## [1] TRUE
```

```r
plot(vroom)
```

<img src="answerKey_files/figure-html/dplyr-1.png" width="672" />

```r
round(cor(vroom), 2)
```

```
##        mpg   cyl  disp    hp  drat    wt  qsec    vs    am  gear  carb   kpl
## mpg   1.00 -0.85 -0.85 -0.78  0.68 -0.87  0.42  0.66  0.60  0.48 -0.55  1.00
## cyl  -0.85  1.00  0.90  0.83 -0.70  0.78 -0.59 -0.81 -0.52 -0.49  0.53 -0.85
## disp -0.85  0.90  1.00  0.79 -0.71  0.89 -0.43 -0.71 -0.59 -0.56  0.39 -0.85
## hp   -0.78  0.83  0.79  1.00 -0.45  0.66 -0.71 -0.72 -0.24 -0.13  0.75 -0.78
## drat  0.68 -0.70 -0.71 -0.45  1.00 -0.71  0.09  0.44  0.71  0.70 -0.09  0.68
## wt   -0.87  0.78  0.89  0.66 -0.71  1.00 -0.17 -0.55 -0.69 -0.58  0.43 -0.87
## qsec  0.42 -0.59 -0.43 -0.71  0.09 -0.17  1.00  0.74 -0.23 -0.21 -0.66  0.42
## vs    0.66 -0.81 -0.71 -0.72  0.44 -0.55  0.74  1.00  0.17  0.21 -0.57  0.66
## am    0.60 -0.52 -0.59 -0.24  0.71 -0.69 -0.23  0.17  1.00  0.79  0.06  0.60
## gear  0.48 -0.49 -0.56 -0.13  0.70 -0.58 -0.21  0.21  0.79  1.00  0.27  0.48
## carb -0.55  0.53  0.39  0.75 -0.09  0.43 -0.66 -0.57  0.06  0.27  1.00 -0.55
## kpl   1.00 -0.85 -0.85 -0.78  0.68 -0.87  0.42  0.66  0.60  0.48 -0.55  1.00
```

```r
prop.table(table(vroom$cyl))
```

```
## 
##       4       6       8 
## 0.34375 0.21875 0.43750
```

```r
table(vroom$cyl, vroom$hp)
```

```
##    
##     52 62 65 66 91 93 95 97 105 109 110 113 123 150 175 180 205 215 230 245 264 335
##   4  1  1  1  2  1  1  1  1   0   1   0   1   0   0   0   0   0   0   0   0   0   0
##   6  0  0  0  0  0  0  0  0   1   0   3   0   2   0   1   0   0   0   0   0   0   0
##   8  0  0  0  0  0  0  0  0   0   0   0   0   0   2   2   3   1   1   1   2   1   1
```

```r
aggregate(hp ~ cyl, data = vroom, FUN = mean)
```

```
##   cyl        hp
## 1   4  82.63636
## 2   6 122.28571
## 3   8 209.21429
```

# Functions


```r
multiply <- function(x, y) return(x * y)
multiply(3, 5)
```

```
## [1] 15
```

```r
addNumbers <- function(x, y, z) return(x + y + z)
addNumbers(1, 10, 100)
```

```
## [1] 111
```

```r
addNumbers <- function(x) return(sum(x))
addNumbers(1:100)
```

```
## [1] 5050
```

```r
addNumbers <- function(x) {
	summe <- sum(x)
	if (summe > 20) {
		stop("Can't count past 20")
	} else {
		return(sum(x))
	}
}
addNumbers(c(1, 19))
```

```
## [1] 20
```

```r
addNumbers(c(1, 20))
```

```
## Error in addNumbers(c(1, 20)): Can't count past 20
```

# Debugging


```r
x <- c(5, 'NA')
y <- c(5, NA)
mean(x)
```

```
## Warning in mean.default(x): argument is not numeric or logical: returning NA
```

```
## [1] NA
```

`debug(mean)` triggers a warning on the following logical check:

```
debug: if (!is.numeric(x) && !is.complex(x) && !is.logical(x)) {
    warning("argument is not numeric or logical: returning NA")
    return(NA_real_)
}
```


```r
!is.numeric(x) && !is.complex(x) && !is.logical(x)
```

```
## [1] TRUE
```

```r
!is.numeric(y) && !is.complex(y) && !is.logical(y)
```

```
## [1] FALSE
```


```r
var()
```

```
## Error in is.data.frame(x): argument "x" is missing, with no default
```

`traceback()` after `var()` returns the following:
```
2: is.data.frame(x)
1: var()
```

Warnings are non-fatal, errors are fatal.
