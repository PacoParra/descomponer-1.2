td <- function(y,significance) {
# Author: Francisco Parra Rodriguez
# Some ideas from:
#Harvey, A.C. (1978), Linear Regression in the Frequency Domain, International Economic Review, 19, 507-512.
# DURBIN, J., "Tests for Serial Correlation in Regression Analysis based on the Periodogram ofLeast-Squares Residuals," Biometrika, 56, (No. 1, 1969), 1-15.
# http://econometria.wordpress.com/2013/08/21/estimation-of-time-varying-regression-coefficients/ 
per <- periodograma(y)
p <- as.numeric(per$densidad)
n <- length(p)
s <- p[1]
t <- 1:n
for(i in 2:n) {s1 <-p[i]+s[(i-1)]
s <- c(s,s1)
s2 <- s/s[n]
}
TestD <- NULL
data(TestD)
rm(TestD)
while (n > 100) n <- 100
c <- subset(TestD, row == n & col==paste("X",as.character(significance),sep=""))$value
min <- -c+(t/length(p))
max <- c+(t/length(p))
data.frame(s2,min,max)
} 
