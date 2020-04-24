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

set.seed(3)
samp <- sample(s, size = 10000, replace = FALSE)
ordered_samp <- sort(samp)
BigCity_red <- BigCity[ordered_samp,]

Rural <- BigCity_red[which(BigCity_red$Zone == "Rural"),]
Rural_Exp <- Rural$Expenditure
length(Rural_Exp)

Rural_ys <- sample(Rural_Exp, size = 30, replace = FALSE)

Urban <- BigCity_red[which(BigCity_red$Zone == "Urban"),]
Urban_Exp <- Urban$Expenditure
length(Urban_Exp)

Urban_ys <- sample(Urban_Exp, size = 30, replace = FALSE)

## ----ex 1.1-------------------------------------------------------------------
mean(Rural_Exp)
mean(Urban_Exp)

## ----ex 1.2-------------------------------------------------------------------
mean(Rural_ys)
mean(Urban_ys)

## ----ex 1.3-------------------------------------------------------------------
ys <- c(Rural_ys, Urban_ys)
h <- c(30,30)
N <- c(length(Rural_Exp), length(Urban_Exp))
m <- c(280, 420)
v=c(4*(10.1^4), 10.1^5)
sigma = c(sqrt(4*10^4), sqrt(10^5))

Estimator <- BLE_SSRS(ys,h,N,m,v,sigma)

## ----ex 1.4-------------------------------------------------------------------
Estimator$est.beta
Estimator$Vest.beta

## ----ex 2---------------------------------------------------------------------
ys <- c(2,-1,1.5, 6,10, 8,8)
h <- c(3,2,2)
m <- c(0,9,8)
v <- c(3,8,1)
sigma <- c(1,2,0.5)
N <- c(5,5,3)


Estimator <- BLE_SSRS(ys,h,N,m,v,sigma)
Estimator

