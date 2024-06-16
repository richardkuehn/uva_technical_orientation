install.packages("tidyverse")
library(tidyverse)

## test ggplot
ggplot(mtcars, aes(x = wt, y = mpg)) + geom_point()

# Euler 1
answer <- 0
for (i in 1:999) {
  if (i %% 3 == 0 | i %% 5 == 0) {
    answer <- answer + i
    print(i)
  }
}
print(answer)