########################################################################
##Title: Creating Shots csv File
##Description: Creates a amalgamated csv file for all players
##Inputs: Requires no inputs; takes csv files from data directory
##Outputs: Summary files for each player, summary file for master csv,
##        and master csv.
########################################################################
setwd("~/Desktop/Stats 133/statsgit/workout01/code")

library(dplyr)
library(ggplot2)

curry <- read.csv("../data/stephen-curry.csv", stringsAsFactors = FALSE)
iguodala <- read.csv("../data/andre-iguodala.csv", stringsAsFactors = FALSE)
green <- read.csv("../data/draymond-green.csv", stringsAsFactors = FALSE)
durant <- read.csv("../data/kevin-durant.csv", stringsAsFactors = FALSE)
thompson <- read.csv("../data/klay-thompson.csv", stringsAsFactors = FALSE)

curry <- mutate(curry, name = "Stephen Curry")
durant <- mutate(durant, name = "Kevin Durant")
green <- mutate(green, name = "Draymond Green")
iguodala <- mutate(iguodala, name = "Andre Iguodala")
thompson <- mutate(thompson, name = "Klay Thompson")

curry$shot_made_flag[curry$shot_made_flag == 'n'] = "shot_no"
curry$shot_made_flag[curry$shot_made_flag == 'y'] = "shot_yes"
durant$shot_made_flag[durant$shot_made_flag == 'n'] = "shot_no"
durant$shot_made_flag[durant$shot_made_flag == 'y'] = "shot_yes"
green$shot_made_flag[green$shot_made_flag == 'n'] = "shot_no"
green$shot_made_flag[green$shot_made_flag == 'y'] = "shot_yes"
iguodala$shot_made_flag[iguodala$shot_made_flag == 'n'] = "shot_no"
iguodala$shot_made_flag[iguodala$shot_made_flag == 'y'] = "shot_yes"
thompson$shot_made_flag[thompson$shot_made_flag == 'n'] = "shot_no"
thompson$shot_made_flag[thompson$shot_made_flag == 'y'] = "shot_yes"

curry <- mutate(curry, minute = period * 12 - (12 - minutes_remaining))
durant <- mutate(durant, minute = period * 12 - (12 - minutes_remaining))
green <- mutate(green, minute = period * 12 - (12 - minutes_remaining))
iguodala <- mutate(iguodala, minute = period * 12 - (12 - minutes_remaining))
thompson <- mutate(thompson, minute = period * 12 - (12 - minutes_remaining))

sink()
summary(curry)
sink(file = "../output/stephen-curry-summary.txt")
sink()
summary(durant)
sink(file = "../output/kevin-durant-summary.txt")
sink()
summary(green)
sink(file = "../output/draymond-green-summary.txt")
sink()
summary(iguodala)
sink(file = "../output/andre-iguodala-summary.txt")
sink()
summary(thompson)
sink(file = "../output/klay-thompson-summary.txt")

player_data <- rbind(curry, durant, green, iguodala, thompson)
write.csv(player_data, file = "../data/shots-data.csv")
sink()
summary(player_data)
sink(file = "../output/shots-data-summary.txt")