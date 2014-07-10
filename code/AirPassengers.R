data(AirPassengers)


air_pass <- as.numeric(AirPassengers)
nmo <- length(air_pass)
nyr <- nmo / 12
airPass <- NULL
for (i in 1:nyr)
{
    airPass <- c(airPass, sum(air_pass[((i - 1) * 12 + 1):(i * 12)]))
}

plot(airPass)

for (j in 1:1000)
{
for (i in 1:2000)
{
    rhyper(1, 100000, 2000, 100)
}
}

require(Rcpp)
sourceCpp("./AirPassengers.cpp")

airsample(10, 20, airPass, 20)

