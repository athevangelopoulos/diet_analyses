#This script computes and exports indices for stomach contents proportions and relative importance by prey taxon and taxonomic category. It also produces the related piedonut plots for visualization.

prey_group_colours = c("#3288BD", "#99D594", "#FEE08B","#F46D43") # colors for prey groups
prey_group_names = c("Teleostei", "Cephalopoda", "Decapoda", "Other Crust.") # names for prey groups

source("pie_donut_full.R")

library(gdata)
library(dplyr)
library(tidyr)
library(ggplot2)
library(webr)

res <- 800
h <- 15
w <- 15
units <- "cm"

data <-read.csv("data.csv")
data <- trim(data)

#All taxonomy
taxonomy_df <- select(data, prey, prey_group)
taxonomy_df <- distinct(taxonomy_df)

stomachs <- length(unique(data$stomach_id))

#%F
F_df <- as.data.frame(table(data['prey']))
F_df$F_pc <- (F_df$Freq * 100) / stomachs

#%N
N_df <- aggregate(data$numbers ~ data$prey, FUN = "sum")
colnames(N_df) <- c("prey", "numbers")
N_sum <- sum(N_df$numbers)
N_df$N_pc <- (N_df$numbers * 100) / N_sum

#%W
W_df <- aggregate(data$weight ~ data$prey, FUN = "sum")
colnames(W_df) <- c("prey", "weight")
W_sum <- sum(W_df$weight)
W_df$W_pc <- (W_df$weight * 100) / W_sum

#put all data frames into list
indices_list <- list(F_df, N_df, W_df)
#merge all data frames in list
indices_df <-
  Reduce(function(x, y)
    merge(x, y, all = TRUE), indices_list)

#IRI
indices_df$IRI <-
  (indices_df$N_pc + indices_df$W_pc) * indices_df$F_pc
IRI_sum <- sum(indices_df$IRI)
indices_df$IRI_pc <- (indices_df$IRI * 100) / IRI_sum

write.csv(indices_df, "indices.csv")

# PieDonut plots

# # %N plot
# piedonut_N_df <- merge(taxonomy_df, N_df, by = "prey", all.y = T)
# piedonut_N_df <- piedonut_N_df[order(piedonut_N_df$prey_group, decreasing = F), ]
# # piedonut_N_df$numbers[is.na(piedonut_N_df$numbers)] <- 0
# png(paste(i, "-", j, "_piedonut_N.png"), height = h, width = w, units = units, res = res)
# pie_donut_full(piedonut_N_df, aes(prey_group, prey, count = numbers), labelposition = 1, showPieName = F, showDonutName = F, title = "", showRatioThreshold = 0.01, ratioByGroup = F, showRatioDonut = F, showRatioPie = F, palette_name=pal)
# dev.off()

# # %W plot
# piedonut_W_df <- merge(taxonomy_df, W_df, by = "prey", all.y = T)
# piedonut_W_df <- piedonut_W_df[order(piedonut_W_df$prey_group, decreasing = F), ]
# piedonut_W_df$weight <- piedonut_W_df$weight * 1000
# piedonut_W_df$weight <- as.integer(piedonut_W_df$weight)
# # piedonut_W_df$weight[is.na(piedonut_W_df$weight)] <- 0
# png(paste(i, "-", j, "_piedonut_W.png"), height = h, width = w, units = units, res = res)
# pie_donut_full(piedonut_W_df, aes(prey_group, prey, count = weight), labelposition = 1, showPieName = F, showDonutName = F, title = "", showRatioThreshold = 0.01, ratioByGroup = F, showRatioDonut = F, showRatioPie = F, palette_name=pal)
# dev.off()

# IRI% plot
piedonut_IRI_df <-
  merge(taxonomy_df, indices_df, by = "prey", all.y = T)
piedonut_IRI_df <-
  piedonut_IRI_df[order(piedonut_IRI_df$prey_group, decreasing = F),]
# write.csv(piedonut_IRI_df, paste(i, "_indices.csv"))
# piedonut_IRI_df$IRI[is.na(piedonut_IRI_df$IRI)] <- 0
png(
  "piedonut_IRI.png",
  height = h,
  width = w,
  units = units,
  res = res
)
pie_donut_full(
  piedonut_IRI_df,
  aes(prey_group, prey, count = IRI),
  labelposition = 1,
  showPieName = F,
  showDonutName = F,
  title = "%IRI",
  showRatioThreshold = 0.01,
  ratioByGroup = F,
  showRatioDonut = F,
  showRatioPie = F
)
dev.off()
      





