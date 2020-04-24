## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(BayesSampling)

## ----ex 1---------------------------------------------------------------------
xs <- matrix(c(1,1,1,1,2,3,5,0),nrow=4,ncol=2)
ys <- c(12,17,28,2)
x_nots <- matrix(c(1,1,1,0,1,4),nrow=3,ncol=2)
a <- c(1.5,6)
R <- matrix(c(10,2,2,10),nrow=2,ncol=2)
Vs <- diag(c(1,1,1,1))
V_nots <- diag(c(1,1,1))

Estimator <- BLE_Reg(ys,xs,a,R,Vs,x_nots,V_nots)
Estimator

