# Calculate fibonacci numbers
#

N <- 32

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

fibonacciR(N)

# cpp
require(Rcpp)
sourceCpp("./fibonacci.cpp")
fibonaccipp(N)

a <- numeric(N)
for (i in 1:N)
{
    if (i == 1 | i == 2)
    {
        a[i] <- 1
    } else {
        a[i] <- a[i - 1] + a[i - 2]
    }
}
