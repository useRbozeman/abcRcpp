us_pop <- as.numeric(uspop)

require(Rcpp)

sourceCpp("./uspop.cpp")

a <- growthFit(us_pop, .25, .1, 300, 100, .2, 1000)
plot(a)

plot(0:18, us_pop)
K <- 211
r <- .3438
lines(0:18, K / (1 + (K / 3.93 - 1) * exp(- r * 0:18)))

plot(0:18, us_pop)
for (i in 1:1000)
{
    # idx <- sample(1:nrow(a), 1)
    idx <- 1
    r <- a[idx, 1]
    K <- a[idx, 2]
    lines(0:18, K / (1 + (K / 3.93 - 1) * exp(- r * 0:18)))
}




