#### packages ####
install.packages("tidyverse")
install.packages("ggplot2")
library(tidyverse)

#### euler problems ####
# euler 1
answer <- 0

for (i in 1:999) {
  if (i %% 3 == 0 | i %% 5 == 0) {
  answer <- answer + i
  print(i)
  }
}

print(answer)


# euler 2
a <- 0
b <- 1
sum_even <- 0

while (TRUE) {
    c <- a + b
    if (c > 4000000) {
      break
    }
    if (c %% 2 == 0) {
      sum_even <- sum_even + c
    }
    a <- b
    b <- c
}

print(sum_even)


# euler 3
is_prime <- function(n) {
  if (n <= 1) return(FALSE)
  if (n == 2) return(TRUE)
  if (n %% 2 == 0) return(FALSE)
  for (i in 3:sqrt(n)) {
    if (n %% i == 0) return(FALSE)
  }
  return(TRUE)
}

largest_prime_factor <- function(n) {
  if (n <= 1) return(NULL)
  largest_factor <- 1
  while (n %% 2 == 0) {
    largest_factor <- 2
    n <- n / 2
  }
  factor <- 3
  while (factor * factor <= n) {
    while (n %% factor == 0) {
      largest_factor <- factor
      n <- n / factor
    }
    factor <- factor + 2
  }
  if (n > 2) {
    largest_factor <- n
  }
  return(largest_factor)
}

number <- 600851475143
result <- largest_prime_factor(number)
print(result)


#### distributions ####


