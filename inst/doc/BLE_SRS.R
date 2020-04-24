## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(BayesSampling)

## ----ex 1, message=FALSE, warning=FALSE---------------------------------------
data(BigCity)
set.seed(1)
Expend <- sample(BigCity$Expenditure,10000)
mean(Expend)          #Real mean expenditure value, goal of the estimation
ys <- sample(Expend, size = 20, replace = FALSE)

## ----ex 1.1-------------------------------------------------------------------
mean(ys)

## ----ex 1.2-------------------------------------------------------------------
Estimator <- BLE_SRS(ys, N = 10000, m=300, v=10.1^5, sigma = sqrt(10^5))

Estimator$est.beta
Estimator$Vest.beta
Estimator$est.mean[1,]
Estimator$Vest.mean[1:5,1:5]

## ----ex 2---------------------------------------------------------------------
ys <- c(5,6,8)
m <- 6
v <- 5
sigma <- 1
N <- 5

Estimator <- BLE_SRS(ys,N,m,v,sigma)
Estimator

