library(gapminder)
library(dplyr)
library(ggplot2)

head(gapminder)

gp <- gapminder

gp_1952 <- gapminder %>%
  filter(year == "1952")

head(gp_1952)
names(gp_1952)

#year 1952 (GDP per capita vs life expectancy for each continent)
ggplot(gp_1952, aes(x = gdpPercap, y = lifeExp, color = continent)) + geom_point()

#log scale for GDP per capita 
ggplot(gp_1952, aes(x = gdpPercap, y = lifeExp, color = continent)) +
  geom_point() + scale_x_log10()


gp_2007 <- gapminder %>%
  filter(year == "2007")

#additional features
ggplot(gp_2007, aes(x = gdpPercap, y = lifeExp, color = continent, size = pop)) +
  geom_point() + scale_x_log10()

#faceting over years
ggplot(gapminder, aes(x = gdpPercap, y = lifeExp, color = continent, size = pop)) +
  geom_point() + facet_wrap(~year) + scale_x_log10()


#Yrly life expectancy trend over time
by_year <- gp %>%
  group_by(year) %>%
  summarize(medLifeExp = median(lifeExp), maxGDPpercap = max(gdpPercap)) 

ggplot(by_year, aes(x = year, y = medLifeExp)) +
  geom_point() + expand_limits(y = 0)