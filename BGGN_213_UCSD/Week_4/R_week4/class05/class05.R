## plotting (ggplot2)

# ggplot(cars) +
# aes(x=speed, y=dist) +
#  geom_point() +
#  labs(title="Speed and Stopping Distances of Cars",
#       x="Speed (MPH)", 
#       y="Stopping Distance (ft)",
#       subtitle = "Your informative subtitle text here",
#       caption="Dataset: 'cars'") +
#  geom_smooth(method="lm", se=FALSE) +
#  theme_bw()

# url <- "https://bioboot.github.io/bimm143_S20/class-material/up_down_expression.txt"
# genes <- read.delim(url)
# head(genes)

# p <- ggplot(genes) + 
  # aes(x=Condition1, y=Condition2, col=State) +
  # geom_point() +
  # labs(title = "Gene Expression Changes Upon Drug Treatment",
       # x="control (no drug)",
       # y="Drug Treatment",
       # caption = "Dataset: genes")
# p
# p + scale_colour_manual( values=c("blue","gray","red") )     

## gapminder

install.packages("gapminder")
library(gapminder)

url <- "https://raw.githubusercontent.com/jennybc/gapminder/master/inst/extdata/gapminder.tsv"
gapminder <- read.delim(url)

library(dplyr)

gapminder_2007 <- gapminder %>% filter(year==2007)


r<- ggplot(gapminder_2007) +
    aes(x=gdpPercap, y=lifeExp) +
    geom_point(alpha=0.5) +
    labs(title = "Nation 2007 gdpPercap vs lifeEXP",
       x = "gdpPercap",
       y = "lifeEXP") +
    theme_bw()
r


q<- ggplot(gapminder_2007) +
    aes(x=gdpPercap, y=lifeExp, color=continent, size=pop) +
    geom_point(alpha=0.5) +
    scale_size_area(max_size = 10) +
    labs(title = "Nation 2007 gdpPercap vs lifeEXP") 
  

q 

s <- ggplot(gapminder_2007) + 
      aes(x = gdpPercap, y = lifeExp, color = pop) +
      geom_point(alpha=0.8) +
      labs(title = "Nation 2007 gdpPercap vs lifeEXP")
s

ggplot(gapminder_2007) + 
  aes(x = gdpPercap, y = lifeExp, size = pop) +
  geom_point(alpha=0.5)


ggplot(gapminder_2007) + 
  geom_point(aes(x = gdpPercap, y = lifeExp,
                 size = pop), alpha=0.5) + 
  scale_size_area(max_size = 10)


gapminder_1957 <- gapminder %>% filter(year==1957)
gapminder_1957

ggplot(gapminder_1957) + 
  geom_point(aes(x = gdpPercap, y = lifeExp,
                 size = pop), alpha=0.5) + 
  scale_size_area(max_size = 10) +
   labs(title = "Nation 1957 gdpPercap vs lifeEXP")



gapminder_1957 <- gapminder %>% filter(year==1957 | year==2007)
  
ggplot(gapminder_1957) + 
geom_point(aes(x = gdpPercap, y = lifeExp, color=continent,
                   size = pop), alpha=0.7) + 
    scale_size_area(max_size = 10) +
    labs(title = "Nation 1957 & 2007 gdpPercap vs lifeEXP") +
    facet_wrap(~year)  
  
gapminder_top5 <- gapminder %>% 
  filter(year==2007) %>% 
  arrange(desc(pop)) %>% 
  top_n(5, pop)

ggplot(gapminder_top5) + 
  geom_col(aes(x = country, y = pop))

ggplot(gapminder_top5) + 
  geom_col(aes(x = country, y = pop, fill = continent))

ggplot(gapminder_top5) + 
  geom_col(aes(x = country, y = pop, fill = lifeExp))


ggplot(gapminder_top5) +
  aes(x=reorder(country, -pop), y=pop, fill=gdpPercap) +
  geom_col()

ggplot(gapminder_top5) +
  aes(x=reorder(country, -pop), y=pop, fill=country) +
  geom_col(col="gray30") +
  guides(fill=FALSE)


USArrests$State <- rownames(USArrests)
ggplot(USArrests) +
  aes(x=reorder(State,Murder), y=Murder) +
  geom_col() +
  coord_flip()


ggplot(USArrests) +
  aes(x=reorder(State,Murder), y=Murder) +
  geom_point() +
  geom_segment(aes(x=State, 
                   xend=State, 
                   y=0, 
                   yend=Murder), color="blue") +
  coord_flip()

sessionInfo()
