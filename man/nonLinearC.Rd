\name{nonLinearC}
\alias{nonLinearC}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Confidence intervals for crossover points using non-linear regression
}
\description{
Calculate confidence intervals for crossover points of two simple linear regression lines using non-linear regression.
}
\usage{
nonLinearC(Data, startingValue)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{Data}{
		a dataframe containing data values for y, x1, and x2
}
  \item{startingValue}{
		a list containing starting values for estimating parameters in non-linear regression
}
}
\details{
For a crossover point C = -b2/b3 of the two simple regression lines, Widaman et al. (2012) proposed to estimate C 
using the non-linear regression of the form y = A0 + A1*(x1-C) + A2*(x1-C)*x2. The function nonLinearC() estimates 
C using the non-linear regression and calculates the confidence intervals for C based on the standard error of C 
obtained from a non-linear regression. 
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
\item{C_Hat}{estimate of C from a non-linear regression}
\item{SE}{standard error of C from a non-linear regression}
\item{LowCI}{lower bound of confidence intervals for C based on a non-linear regression}
\item{UpperCI}{upper bound of confidence intervals for C based on a non-linear regression}

}
\references{
Aiken, L. S., & West, S. G. (1991). Multiple regression: Testing and interpreting interactions. Newbury Park, CA: Sage

Widaman, K. F., Helm, J. L., Castro-Schilo, L., Pluess, M., Stallings, M. C., & Belsky, J. (2012). Distinguishing ordinal and disordinal interactions. Psychological Methods, 17, 615-622
}
\author{
Sunbok Lee
}

\examples{
# set initial values for non-linear regression 
startingValue <- list(A0 = 1, B1 = 1, B2 = 1, C = 1)  

# example data
library(MASS)
out <- mvrnorm(1000, mu = c(0,0), Sigma = matrix(c(1,0.2,0.2,1), ncol = 2),empirical = TRUE)
x1 <- out[,1]
x2 <- out[,2]
epsilon <-rnorm(1000,0,1)
y <- 1 + 1*x1 + 0.5*x2 + 1*x1*x2 + epsilon  # true C = -0.5/1 = -0.5
simData <- data.frame(y=y,x1=x1,x2=x2)

# run nonLinearC()
nonLinearC(simData, startingValue)
}

