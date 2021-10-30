#do cars with big engines use more fuel than cars with small engines
#what is the relationship between engine size and fuel efficincy

library(ggplot2)
library(tidyverse)

?mpg
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))
#plot shows a negative relationshp,
#cars with higher engine size travel less highwaymiles per gallon

ggplot(data = mpg)
str(mpg)
?mpg

#highway miles vs cylinder
ggplot(data = mpg) + 
  geom_point(mapping = aes(x= hwy, y= displ, size = class))

ggplot(data = mpg)+ geom_point(mapping = aes(x = class, y= drv))

# Left
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))

# Right
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))



#working with GGPLoT

#making a scatterplot
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

ggplot(data = <DATA>) + 
  <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>))
#mappings scatter plots can be ordered by size, colour

library(stats)
data("iris")
str(iris)
library(tidyr)
?tidyr


require(graphics)
mosaicplot(Titanic, main = "Survival on the Titanic")
## Higher survival rates in children?
apply(Titanic, c(3, 4), sum)
## Higher survival rates in females?
apply(Titanic, c(2, 4), sum)
## Use loglm() in package 'MASS' for further analysis ...
require(graphics)
mosaicplot(Titanic, main = "Survival on the Titanic")
## Higher survival rates in children?
apply(Titanic, c(3, 4), sum)
## Higher survival rates in females?
apply(Titanic, c(2, 4), sum)
## Use loglm() in package 'MASS' for further analysis ...

x <- 10

y <- c(1,2,3,4,5)
y
# generate the vector `z`
z <- seq(from = 10, to = 15, by = 3)

# compute the mean of the enries in `z`
mean(x = z)

library(help = "stats")

# generate the vector of probabilities 
probability <- rep(1/6, 6) 

# plot the probabilites 
plot(probability, main = "Probability Distribution", xlab = "outcomes")

#creating a map of illinois state
#install maps package
install.packages("maps")
il_state <- map_data("state","illinois")

#ggplot map geom aesthetics
ggplot() + 
  geom_map(data = il_state, mapping = aes(map_id = region,x = long, y = lat),
           color = "blue", map = il_state)

??cast

library(ggplot2)
library(ggmap)
library(maps)
library(mapdata)

??stripplot

library(tidyverse)
?mpg

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = cyl, y = hwy, color = class, size = class)) 

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ<4, y = hwy), color = "purple")

?geom_point
?facet_wrap

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "purple")+ 
  facet_grid(drv ~ cyl) 
?nrow

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ .)
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(. ~ cyl)

?facet_wrap
# left
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

# right
ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, color = drv, fill = cyl))

?fill

ggplot(data=train)+
  geom_point(train,mapping=aes(x=Survived,y=Age,
                               shape=Sex,show.legend=TRUE))+geom_jitter()

?geom_smooth

ggplot(data = mpg) + 
  geom_curve(mapping = aes(x = displ, y = hwy, xend = ))

?xend

x <- 123456
round(x,0)

demo()

#tibbles
#the tibble package, part of the core tidyverse.
library(ggplot2)
library(tidyverse)

# as_tibble() converts to a tibble
as_tibble(iris)

#You can create a new tibble from individual vectors with tibble()

#Another way to create a tibble is with tribble(), short for transposed tibble

#R Programming

library(dslabs)
data(murders)
murder_rate <- murders$total / murders$population*100000

#If statemets
#create an ndex of the state with the lowest murder rate
ind <- which.min(murder_rate)

#find out wich state it coresponds to
murders$state[46]

#if statement to determine which states murder rates are lower than 0.5
if(murder_rate[ind] < 0.5){
  print(murders$state[ind]) 
} else{
  print("No state has murder rate that low")
}

#if statement to determine which states murder rate are lower than 0.25
if(murder_rate[ind] < 0.25){
  print(murders$state[ind]) 
} else{
  print("No state has a murder rate that low.")
}

#the if_else function
a <- 0
ifelse(a > 0, 1/a, NA)

a <- c(0, 1, 2, -4, 5)
result <- ifelse(a > 0, 1/a, NA)

result
#[1]  NA 1.0 0.5  NA 0.2


library(tidyverse)
library(nycflights13)
airlines

