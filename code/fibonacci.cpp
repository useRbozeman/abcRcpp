#include <Rcpp.h>

using namespace Rcpp;

// [[Rcpp::export]]
int fibonaccipp(int n)
{
        if ( (n == 0) | (n == 1) )
        {
                return 1;
        } else {
                return fibonaccipp(n - 1) + fibonaccipp(n - 2);
        }
}

