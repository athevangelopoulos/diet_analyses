#This script plots modified Costello graphs for species diet data

library(gdata)
library(dplyr)
library(ggplot2)

# Set .png file parameters
resolution <- 800
h <- 15
w <- 20
units <- "cm"

taxonomy <- read.csv("taxonomy.csv")
taxonomy <- trim(taxonomy)

data <-read.csv("data.csv")

#%F
full <- length(unique(data$stomach_id))
F_df <- as.data.frame(table(data['prey']))
F_df$F_pc <- F_df$Freq / full # F in proportion

res <- data.frame(prey = c(),
                  Pi = c())

preys <- unique(data$prey)

for(i in preys){
  
  #%N
  data_i <- data[data$prey == i,] # subset full_df for prey i
  sum_i <- sum(data_i$numbers) # total N of prey i in all stomachs where there is prey i
  
  stomachs_i <- unique(data_i$stomach_id) # which stomachs have prey i
  
  full_df_i <- data[data$stomach_id %in% stomachs_i,] # subset full_df for stomachs that have prey i
  sum_stomachs_i <- sum(full_df_i$numbers) # total N of all prey in all stomachs where there is prey i
  
  Pi <- sum_i/sum_stomachs_i
  Pi <- Pi * 100
  
  res_i <- data.frame(prey = i,
                    Pi = Pi)
  
  res <- rbind(res, res_i)
  
}

costello_mod <- merge(F_df, res, by = "prey")
costello_mod <- costello_mod[,c(1, 3, 4)]
costello_mod <- merge(costello_mod, taxonomy, by = "prey", all.x = T)

png(
  "mod_Costello.png",
  height = h,
  width = w,
  units = units,
  res = resolution
)
ggplot(costello_mod, aes(F_pc, Pi, colour = prey_group)) + 
  geom_point(size = 5) +
  # geom_text(
  #   label=costello_mod$prey, 
  #   nudge_x = 0.01, nudge_y = -2, 
  #   check_overlap = F) +
  ggtitle("Modified Costello graph") +
  xlab("Frequency of occurrence") + 
  ylab("Prey-specific abundance (%)") +
  xlim(0, 1) +
  ylim(0, 100) +
  theme_bw() +
  theme(text = element_text(size = 20)) +
  scale_color_manual(values = c("Cephalopoda" = "#99D594",
                                "Decapoda" ="#FEE08B",
                                "Other Crustacea"="#F46D43",
                                "Teleostei" = "#3288BD")) 
dev.off()

