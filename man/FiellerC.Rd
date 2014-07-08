\name{FiellerC}
\alias{FiellerC}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Confidence intervals for crossover points using the Fieller method
}
\description{
Calculate confidence intervals for crossover points of two simple linear regression lines using the Fieller method.
}
\usage{
FiellerC(Data)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{Data}{
a dataframe containing data values for y, x1, and x2
}
}
\details{
Fieller (1954) proposed a method for calculating the confidence interval for the ratio of two normally 
distributed random variables without assuming any particular form for the sampling distribution of the ratio itself.
The function FiellerC() calculates confidence intervals for the crossover points of two simple regression lines
using the Fieller method. 
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
\item{LowCI}{lower bound of confidence intervals for C based on the Fieller method}
\item{UpperCI}{upper bound of confidence intervals for C based on the Fieller method}

}
\references{
Fieller, E. C. (1954). Some problems in interval estimation. Journal of the Royal Statistical Society, Series B: Methodological, 16, 175-185.
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

# run FiellerC()
FiellerC(simData)
}

