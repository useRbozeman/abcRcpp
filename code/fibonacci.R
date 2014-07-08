# Calculate fibonacci numbers
#

# R
fibonacciR <- function(n)
{
    if ( (n == 0) | (n == 1) )
    {
        return(1)
    } else {
        return(fibonacciR(n - 1) + fibonacciR(n - 2))
    }
}

fibonacciR(33)

# cpp
require(Rcpp)
sourceCpp("./fibonacci.cpp")
fibonaccipp(32)
