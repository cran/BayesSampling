% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sample_designs.R
\name{BLE_SRS}
\alias{BLE_SRS}
\title{Simple Random Sample BLE}
\source{
\url{https://www150.statcan.gc.ca/n1/en/catalogue/12-001-X201400111886}
}
\usage{
BLE_SRS(ys, N, m = NULL, v = NULL, sigma = NULL, n = NULL)
}
\arguments{
\item{ys}{vector of sample observations or sample mean (\code{sigma} and \code{n} parameters will be required in this case).}

\item{N}{total size of the population.}

\item{m}{prior mean. If \code{NULL}, sample mean will be used (non-informative prior).}

\item{v}{prior variance of an element from the population (bigger than \code{sigma^2}). If \code{NULL}, it will tend to infinity (non-informative prior).}

\item{sigma}{prior estimate of variability (standard deviation) within the population. If \code{NULL}, sample variance will be used.}

\item{n}{sample size. Necessary only if \code{ys} represent sample mean (will not be used otherwise).}
}
\value{
A list containing the following components: \itemize{
\item \code{est.beta} - BLE of Beta (BLE for every individual)
\item \code{Vest.beta} - Variance associated with the above
\item \code{est.mean} - BLE for each individual not in the sample
\item \code{Vest.mean} - Covariance matrix associated with the above
\item \code{est.tot} - BLE for the total
\item \code{Vest.tot} - Variance associated with the above
}
}
\description{
Creates the Bayes Linear Estimator for the Simple Random Sampling design (without replacement)
}
\examples{
ys <- c(5,6,8)
N <- 5
m <- 6
v <- 5
sigma <- 1

Estimator <- BLE_SRS(ys, N, m, v, sigma)
Estimator


# Same example but informing sample mean and sample size instead of sample observations
ys <- mean(c(5,6,8))
N <- 5
n <- 3
m <- 6
v <- 5
sigma <- 1

Estimator <- BLE_SRS(ys, N, m, v, sigma, n)
Estimator

}
\references{
Gonçalves, K.C.M, Moura, F.A.S and  Migon, H.S.(2014). Bayes Linear Estimation for Finite Population with emphasis on categorical data. Survey Methodology, 40, 15-28.
}
