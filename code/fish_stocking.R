growth <- function(x, kappa) {
    return(1 + exp( - x / kappa * log(2)))
}

pop <- function(x, kappa) {
    return(exp(-x / kappa * log(2)))
}

evolve <- function(N, S, Food, kappa_g, kappa_d) {
    Fper <- Food / (N * S)
    Np <- N * pop(Fper, kappa_d)
    Sp <- S * growth(Fper, kappa_g)
    return(c(Np, Sp))
}

kappa_d <- .5
kappa_g <- 1
Food <- 2500

N0 <- seq(1000, 10000, 10)
S0 <- seq(0, 4, .1)

N12 <- array(dim = c(length(N0), length(S0)), 0)

for (i in 1:length(N0))
{
    for (j in 1:length(S0))
    {
        out <- c(N0[i], S0[j])
        for (t in 1:5)
        {
            Food <- runif(1, 2000, 3000)
            out <- evolve(out[1], out[2], Food, kappa_g, kappa_d)
        }
        if (out[2] > 12 & out[1] > 1)
        {
            N12[i, j] <- out[1] / (N0[i] * S0[j] ^ 2)
        }
    }
}


filled.contour(N0, S0, N12)
