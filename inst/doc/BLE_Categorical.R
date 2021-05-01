## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(BayesSampling)

## ----ex 1, message=TRUE, warning=TRUE-----------------------------------------
ys <- c(0.2614, 0.7386)
n <- 153
N <- 15288
m <- c(0.7, 0.3)
rho <- matrix(0.1, 1)
Estimator <- BLE_Categorical(ys,n,N,m,rho)

Estimator$est.prop
Estimator$Vest.prop

## ----ex 1.2, message=TRUE, warning=TRUE---------------------------------------
ys <- c(0.2614, 0.7386)
n <- 153
N <- 15288
m <- c(0.7, 0.3)
rho <- matrix(0.5, 1)
Estimator <- BLE_Categorical(ys,n,N,m,rho)

Estimator$est.prop
Estimator$Vest.prop

## ----ex 2, message=TRUE, warning=TRUE-----------------------------------------
ys <- c(0.2, 0.5, 0.3)
n <- 100
N <- 10000
m <- c(0.4, 0.1, 0.5)
mat <- c(0.4, 0.1, 0.1, 0.1, 0.2, 0.1, 0.1, 0.1, 0.6)
rho <- matrix(mat, 3, 3)

Estimator <- BLE_Categorical(ys,n,N,m,rho)

Estimator$est.prop
Estimator$Vest.prop

## ----ex 2.2, message=TRUE, warning=TRUE---------------------------------------
ys <- c(0.2, 0.5, 0.3)
n <- 100
N <- 10000
m <- c(0.4, 0.1, 0.5)

Estimator <- BLE_Categorical(ys,n,N,m,rho=NULL)

Estimator$est.prop

