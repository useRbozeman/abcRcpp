#include <Rcpp.h>
double compare(double, double);

using namespace Rcpp;


// [[Rcpp::export]]
double findMax(NumericVector x)
{
        int i;
        int n = x.size();
        double max = x[0];

        for (i=1; i <n; i++)
        {
                max = compare(x[i], max);
        }

        return max;
}

double compare(double a, double b)
{
        if (a > b)
        {
                return a;
        } else {
                return b;
        }
}
