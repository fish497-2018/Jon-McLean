

fish_data <- read.csv("data/Gaeta_etal_CLC_data_1.csv")

#2)
#this addsa a category to the table that categorizes fish by size
library(dplyr)
fish_data_cat = fish_data %>%
  mutate(length_cat = ifelse(length > 300, "big", "small")) %>% 
  filter(scalelength > 1)


library(tidyverse)
#Creates a scatterplot of length and scale length, then groups by lake id
ggplot(fish_data_cat, aes(length, scalelength, color = lakeid)) +
         geom_point()


#6)
#Plot histogram of scale length by fish categorical size
week_7_histogram <- ggplot(fish_data_cat, aes(x = scalelength, fill = length_cat)) +
  geom_histogram(bins = 80)

ggsave("figures/week_7_histogram.pdf")