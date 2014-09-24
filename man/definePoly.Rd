\name{definePoly}
\alias{definePoly}
\alias{evalPoly}
\alias{printPoly}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Define, evaluate, or print a polynomial
}
\description{
Utility functions to work with a multivariate polynomial.
}
\usage{
definePoly(coef, k)
printPoly( p, num.digits )
evalPoly( x, p, useTerm=rep(TRUE, length(p$coef) ) )
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{coef}{
a vector of coefficients, one for each term of p(x)
}
  \item{k}{
a matrix of (non-negative, integer) powers
}
  \item{p}{a polynomial, defined by definePoly}
  \item{num.digits}{number of digits to print for the coefficients of the polynomial}
  \item{x}{
a (n x m) matrix, with columns containing the vectors where the polynomial should be evaluated
}
  \item{useTerm}{
  vector of boolean values: if useTerm[i]=TRUE, term i is included in the evaluation;
  if useTerm[i]=FALSE, term i is not included.
  }
  }
\details{
These are utility functions for use with integrateSimplexPolynomial.  definePoly is used to 
define a polynomial: 
\deqn{p(x)=\sum_{i=1}^{\mathrm{length(coef)}} \mathrm{coef}_i x_1^{k[i,1]} x_2^{k[i,2]} 
    \cdots x_n^{k[i,n]} }{p(x)=sum(coef[i] * x[1]^k[i,1]* x[2]^k[i,2] * ... * x[n]^k[i,n]), where the sum is over i=1,...,length(coef).}

printPoly prints a polynomial in human readable form.

evalPoly evaluates a polynomial at each of the vectors x[,1],x[,2],...,x[,m].
The optional argument useTerm is for internal use.

See example below.
}
\value{
For definePoly, a list is returned.  That list can be used by integrateSimplexPolynomial, printPoly,
or evalPoly.

For printPoly, nothing is returned, but a human readable format is printed on the console.

For evalPoly, a vector of m values: y[i] = p(x[,i]).
}
\note{
The internal definition of a polynomial may change in the future.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{integrateSimplexPolynomial}}
}
\examples{
p1 <- definePoly( c(3,5), matrix(c(3,0,0,0, 0,2,1,4), nrow=2, ncol=4, byrow=TRUE ) )
printPoly(p1)
evalPoly( c(1,3,1,2) , p1 ) # f(1,3,1,2) = 723


}
