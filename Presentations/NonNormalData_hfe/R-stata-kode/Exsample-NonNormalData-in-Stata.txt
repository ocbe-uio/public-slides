*---------------------------------------------------------------*
* Analysis of non-normal data using Stata                       *
* Example by harald.weedon-fekjar@medisin.uio.no, 2025          *
*---------------------------------------------------------------*

* Download the NHANES data from GitHub:
import delimited using "https://raw.githubusercontent.com/ProjectMOSAIC/NHANES/refs/heads/master/data-raw/NHANES.csv", clear

* Drop observations with missing alcoholyear and make it numeric:
drop if alcoholyear=="NA"
destring alcoholyear, replace

* Keep only variables of interest: alcoholyear and Gender
keep alcoholyear gender

* Keep only the first 80 observations
keep in 1/80

* Inspect first few observations
list in 1/6


*----------------------*
* Descriptive analysis *
*----------------------*

* Descriptive statistics:
summarize alcoholyear , detail

* Histogram and density for alcoholyear 
histogram alcoholyear , frequency title("Alcohol consumption") ///
    ylabel(, angle(horizontal)) ///
    subtitle("Days of alcohol consumption per year")

* Differences by gender: means and difference
summarize alcoholyear if gender=="female"
summarize alcoholyear if gender=="male"
ttest alcoholyear, by(gender)


*---------------------------*
* Check normal distribution *
*---------------------------*

* QQ-Plot for normality check
qnorm alcoholyear 


*---------------------------------------------------------------*
* Bootstrap confidence intervals (10,000 replications, BCa)     *
*---------------------------------------------------------------*

* Mean of alcoholyear 
capture program drop bootmean
program define bootmean, rclass
    quietly summarize alcoholyear 
    return scalar meanval = r(mean)
end
bootstrap r(meanval), reps(10000) dots(1000) seed(4) bca: bootmean
estat bootstrap, all

* Median of alcoholyear 
capture program drop bootmedian
program define bootmedian, rclass
    quietly summarize alcoholyear , detail
    return scalar medval = r(p50)
end
bootstrap r(medval), reps(10000) dots(1000) seed(4) bca: bootmedian
estat bootstrap, all

* Difference in means by gender
capture program drop bootdiff
program define bootdiff, rclass
    * Summarize female
    quietly summarize alcoholyear if gender=="female"
    local meanF = r(mean)
    * Summarize male
    quietly summarize alcoholyear if gender=="male"
    local meanM = r(mean)
    return scalar diff = `meanF' - `meanM'
end
bootstrap r(diff), reps(10000) dots(1000) seed(4) bca: bootdiff
estat bootstrap, all

