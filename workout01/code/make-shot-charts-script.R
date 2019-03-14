########################################################################
##Title: Make Shot Charts Script
##Description: Script that makes shot charts.
##Inputs: Takes player data csvs as well as amalgamated player data csv
##Outputs: shot charts
########################################################################

setwd("~/Desktop/Stats 133/statsgit/workout01/code")

library(dplyr)
library(ggplot2)
library(jpeg)
library(grid)

curry <- read.csv("../data/stephen-curry.csv", stringsAsFactors = FALSE)
iguodala <- read.csv("../data/andre-iguodala.csv", stringsAsFactors = FALSE)
green <- read.csv("../data/draymond-green.csv", stringsAsFactors = FALSE)
durant <- read.csv("../data/kevin-durant.csv", stringsAsFactors = FALSE)
thompson <- read.csv("../data/klay-thompson.csv", stringsAsFactors = FALSE)

court_file <- "../images/nba-court.jpg"
court_image <- rasterGrob(readJPEG(court_file), width = unit(1, "npc"), height = unit(1, "npc"))

curry_scatter <- ggplot(data = curry) + 
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) +
  ggtitle('Shot Chart: Stephen Curry (2016 Season)') + 
  theme_minimal()
ggsave("../images/stephen-curry-shot-chart.pdf", plot = curry_scatter, width = 6.5, height = 5, units = "in")

iguodala_scatter <- ggplot(data = iguodala) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) +
  ggtitle('Shot Chart: Andre Iguodala (2016 Season)') + 
  theme_minimal()
ggsave("../images/andre-iguodala-shot-chart.pdf", plot = iguodala_scatter, width = 6.5, height = 5, units = "in")

green_scatter <- ggplot(data = green) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Draymond Green (2016 Season)') + 
  theme_minimal()
ggsave("../images/draymond-green-shot-chart.pdf", plot = green_scatter, width = 6.5, height = 5, units = "in")

durant_scatter <- ggplot(data = durant) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Kevin Durant (2016 Season)') + 
  theme_minimal()
ggsave("../images/kevin-durant-shot-chart.pdf", plot = durant_scatter, width = 6.5, height = 5, units = "in")

thompson_scatter <- ggplot(data = thompson) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson (2016 Season)') + 
  theme_minimal()
ggsave("../images/klay-thompson-shot-chart.pdf", plot = thompson_scatter, width = 6.5, height = 5, units = "in")

player_data <- read.csv("../shots-data.csv", stringsAsFactors = FALSE)
shots_scatter <- ggplot(data = player_data) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: GSW (2016 Season)') + 
  facet_grid(~ name)
  theme_minimal()
ggsave("../images/gsw-shot-charts.pdf", plot = shots_scatter, width = 8, height = 7, units = "in")
ggsave("../images/gsw-shot-charts.png", plot = shots_scatter, width = 8, height = 7, units = "in")
