# diet_analyses

Species diet data analyses

## Prey taxa proportions in stomach contents and relative importance in the diet

### diet_proportions.R
diet_proportions.R computes prey taxa and categories frequencies in the stomachs (%F) and their proportions in numbers (%N) and weight (%W) in the stomach contents. It also computes the Index of Relative Importance (IRI)  and its % form (%IRI). The computed index values are exported as a .csv file. The %N, %W and %IRI values are also plotted as pie-donut graphs and exported as .png files.

### pie_donut_full.R
Definition of the pie_donut_full() function that plots the pie-donut graphs, adapted from the [version](https://stackoverflow.com/questions/68095243/piedonut-how-to-change-color-of-pie-and-donut) that was posted on stackoverflow by Amélie Gourdon-Kanhukamwe. In the present version, the colors of prey taxonomic categories are fixed, and maintained across plots.

## Modified Costello graph

