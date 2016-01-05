\name{SimplicialCubature-package}
\alias{SimplicialCubature-package}
\alias{SimplicialCubature}
\docType{package}
\title{
Numerical integration of functions over simplices
}
\description{Provides methods to evaluate integrals of the form
\deqn{\int_S f(x) dx,}{(integral over S) f(x) dx,}
where S is a simplex (or a union of simplices) in n-space and f(x) is a function defined on S.
The function f(x) may be vector valued and the simplices can be m-dimensional simplices, 
1 <= m <=n.  For example, if m=n-1, the package will evaluate a surface area integral;
if m=1, the package will evaluate a line integral.

There are exact methods for polynomials and
 adaptive methods for integrating an arbitrary function.
The two main functions are:

\code{\link{adaptIntegrateSimplex}} - integrate a general (possibly vector valued) 
function over a simplex using the method of Genz and Cools.

\code{\link{integrateSimplexPolynomial}} - integrate a single polynomial exactly over a simplex using either 
the Grundmann-Moller method or the Lasserre-Avrachenkov method.

The naming of the functions, arguments, and return values deliberately mimics that in the CRAN packages
\code{cubature} (for integrating over hyper-rectangles) and \code{SphericalCubature} (for integrating
over spheres and balls).

Please let me know if you find any mistakes.  I will try to fix bugs promptly.

Constructive comments for improvements are welcome;  
actually implementing any suggestions will be dependent on time constraints.

Version history: 
\itemize{
\item 1.0.1  original package
\item 1.1  fix an incorrect test for dimension=1 in \code{SimplexVolume}; add functions \code{SimplexSurfaceArea}.  Rename function 
   \code{UnitSimplex} to \code{UnitSimplexV} to eliminate name conflict with function in package \code{mvmesh}.
}
}
\details{
\tabular{ll}{
Package: \tab SimplicialCubature\cr
Type: \tab Package\cr
Version: \tab 1.1\cr
Date: \tab 2016-01-05\cr
License: \tab GPL (>= 3) \cr
}
}
\author{
John P. Nolan, with R translations of \code{adsimp} code by Alan Genz

Maintainer: John P. Nolan <jpnolan@american.edu>

This research was supported by an agreement with Cornell University, Operations 
Research & Information Engineering, under contract W911NF-12-1-0385 from the Army 
Research Development and Engineering Command.
}

\references{
V. Baldoni, N. Berline, J. A. De Loera, M. Koppe, and M. Vergene,
How to integrate a polynomial over a simplex, Mathematics of Computation,
80, 297-325 (2011)

A. Genz and R. Cools, An adaptive numerical cubature algorithm for simplices,
ACM Trans. Math. Software, 29, 297-308 (2003)

A. Grundmann and H.M. Moller, Invariant Integration Formulas for the n-Simplex by 
Combinatorial Methods, SIAM Journal on Numerical Analysis, 15, 282-289 (1978)

J. B. Lasserre and E. E. Avrachenkov, The Multi-Dimensional Version of 
\eqn{\int^b_a x^p dx}{(integral from a to b) x^p dx},
American Mathematical Monthly, 108,  151-154 (2001)

N. Konerth, Exact integration on simplices, Undergraduate Research Paper, 
Math/Stat Department, American University (2014).  Online at
http://aladinrc.wrlc.org/handle/1961/14863
}
\seealso{\code{\link{adaptIntegrateSimplex}}, 
\code{\link{integrateSimplexPolynomial}}
}
\keyword{ Numerical mathematics }
\keyword{ multivariate integration }
\keyword{cubature }
