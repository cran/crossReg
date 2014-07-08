\name{BootC}
\alias{BootC}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Confidence intervals for crossover points using the bootstrap methods
}
\description{
Calculate confidence intervals for crossover points of two simple linear regression lines using the bootstrap
}
\usage{
BootC(Data)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{Data}{
		a dataframe containing data values for y, x1, and x2
}
}
\details{
The function BootC() calculates confidence intervals for the crossover point C using the boot package in R. Bootstrap confidence intervals 
include Normal, Basic, Percentile, and BCa confidence intervals. 
 

}

\references{
Bollen, K. A., & Stine, R. (1990). Direct and indirect effects: Classical and bootstrap estimate of variability. Sociological Methodology, 20, 115-140.}
\author{
Sunbok Lee
}


%% ~Make other sections like Warning with \section{Warning }{....} ~


\examples{
# example data
library(MASS)
out <- mvrnorm(1000, mu = c(0,0), Sigma = matrix(c(1,0.2,0.2,1), ncol = 2),empirical = TRUE)
x1 <- out[,1]
x2 <- out[,2]
epsilon <-rnorm(1000,0,1)
y <- 1 + 1*x1 + 0.5*x2 + 1*x1*x2 + epsilon  # true C = -0.5/1 = -0.5
simData <- data.frame(y=y,x1=x1,x2=x2)

# run BootC()
library(boot)
BootC(simData)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
