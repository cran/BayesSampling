## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(BayesSampling)

## ----ex 1, message=FALSE, warning=FALSE---------------------------------------
data(BigCity)
end <- dim(BigCity)[1]
s <- seq(from = 1, to = end, by = 1)

set.seed(5)
samp <- sample(s, size = 10000, replace = FALSE)
ordered_samp <- sort(samp)
BigCity_red <- BigCity[ordered_samp,]

Expend <- BigCity_red$Expenditure
Income <- BigCity_red$Income

sampl <- sample(seq(1,10000),size=10)
ys <- Expend[sampl]
xs <- Income[sampl]

## ----ex 1.1-------------------------------------------------------------------
mean(Expend/Income)

## ----ex 1.2-------------------------------------------------------------------
mean(ys)/mean(xs)

## ----ex 1.3-------------------------------------------------------------------
x_nots <- BigCity_red$Income[-sampl]

Estimator <- BLE_Ratio(ys,xs,x_nots, m = 0.85, v = 0.24, sigma = sqrt(0.23998))

Estimator$est.beta
Estimator$Vest.beta
Estimator$est.mean[1:4,]
Estimator$Vest.mean[1:5,1:5]
Estimator$est.tot

## ----ex 2---------------------------------------------------------------------
ys <- c(10,8,6)
xs <- c(5,4,3.1)
x_nots <- c(1,20,13,15,-5)
m <- 2.5
v <- 10
sigma <- 2


Estimator <- BLE_Ratio(ys,xs,x_nots,m,v,sigma)
Estimator

