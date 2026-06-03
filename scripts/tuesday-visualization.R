## Visualization with ggplot2


# Set up script -----------------------------------------------------------

library(tidyverse)
interviews_plotting <- read_csv("data/interviews-plotting.csv")

# Basic structure of ggplot2
interviews_plotting |> 
  ggplot(mapping = aes(x = no_membrs, y = number_items)) +
  geom_point(alpha = 0.5) # the alpha argument changes the transparency of the points

# Using a different geom, geom_jitter in this case
interviews_plotting |> 
  ggplot(mapping = aes(x = no_membrs, y = number_items)) + 
  geom_jitter(alpha = 0.7,
              width = 0.2,
              height = 0.2)

# Adding more visual characteristics: Setting color
interviews_plotting |> 
  ggplot(mapping = aes(x = no_membrs, y = number_items)) + 
  geom_jitter(alpha = 0.7,
              width = 0.2,
              height = 0.2,
              color = "dodgerblue")

# Mapping color
interviews_plotting |>
  filter_out(is.na(memb_assoc)) |> 
  ggplot(mapping = aes(x = no_membrs, y = number_items, 
                       color = village, shape = memb_assoc)) + 
  geom_jitter(alpha = 0.7,
              width = 0.2,
              height = 0.2)

# Mapping aesthetics in geom
interviews_plotting |>
  filter_out(is.na(memb_assoc)) |> 
  ggplot(mapping = aes(x = no_membrs, y = number_items)) + 
  geom_jitter(aes(color = village, shape = memb_assoc),
              alpha = 0.7,
              width = 0.2,
              height = 0.2)

#NOTE: In the aesthetics function you are setting things to columns, but outside of it you are setting things to values.

# 
interviews_plotting |>
  filter_out(is.na(memb_assoc)) |> 
  ggplot(mapping = aes(x = no_membrs, y = number_items)) + 
  geom_jitter(aes(color = village, shape = memb_assoc),
              alpha = 0.7,
              width = 0.2,
              height = 0.2) + 
  scale_color_viridis_d()

# Another plot
interviews_plotting |> 
  ggplot(aes(x = respondent_wall_type, y = rooms)) +
  geom_boxplot()

# Investigate the plot
interviews_plotting |> 
  count(respondent_wall_type)

interviews_plotting |> 
  filter(respondent_wall_type != "cement") |> 
  ggplot(aes(x = respondent_wall_type, y = rooms)) +
  geom_boxplot(outliers = FALSE) + 
  geom_jitter(aes(color = village),
              width = 0.1, height = 0)
#NOTE: Geoms add up on each other when you are layering them

# Geoms with statistical transformations
interviews_plotting |> 
  ggplot(aes(x = fct_infreq(respondent_wall_type))) +
  geom_bar(aes(fill = village)) +
  labs(x = "Wall Type",
       y = NULL,
       fill = "Village") +
  theme_classic()

# Saving the graph
ggsave("fig/wall-type.png", height = 15, width = 10)

#Note the color argument colors up just lines, while the fill argument fills a shape with color.