\name{DeltaC}
\alias{DeltaC}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Confidence intervals for crossover points using the delta method
}
\description{
Calculate confidence intervals for crossover points of two simple linear regression lines using the delta method.
}
\usage{
DeltaC(Data, order)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{Data}{
		a dataframe containing data values for y, x1, and x2
}
  \item{order}{
        a scalar number representing the order of Delta method. 1=1st order delta method and 
		2=2nd order delta method
}
}
\details{
Given a linear regression model y = b0 + b1*x1 + b2*x2 + b3*x1*x2, the crossover point of two simple regression lines can be directly calculated based on C=-b2/b3. 
The Delta method can be used to estimate the standard error of C = -b2/b3 based on the standard errors of b2 and b3 which can be obtained from a 
linear regression. The function DeltaC() calculates the confidence intervals for C based on the standard error of C 
obtained from the delta method. 
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
\item{LowCI}{lower bound of confidence intervals for C based on the delta method}
\item{UpperCI}{upper bound of confidence intervals for C based on the delta method}

}
\references{
%% ~put references to the literature/web site here ~
Preacher, K. J., Rucker, D. D., & Hayes, A. F. (2007). Assessing moderated mediation hypotheses: Theory, methods, and prescriptions. Multivariate Behavioral Research, 42, 185-227.

Sobel, M. E. (1982). Asymptotic confidence intervals for indirect effects in structural equation models. Sociological Methodology, 13, 290-312.

}
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

# run DeltaC()
DeltaC(simData,2)
}

