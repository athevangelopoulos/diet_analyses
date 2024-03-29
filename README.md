# diet_analyses

Scripts for species diet data analyses.

## Input data format

The input data should have the same format as in the sample data file data.csv. Column headings sould be identical. stomach_id column should contain unique IDs that distinguish the stomachs in the analysis.

### data.csv

Stomach contents analysis sample data file.

## Prey taxa proportions and their relative importance in the diet of a predator

The proportions of prey taxa in the diet of a predator are typically given as their frequencies in the stomachs (%F) and their proportions in numbers (%N) and weight (%W) in the stomach contents. Prey relative importance is estimated with the Index of Relative Importance (%IRI), which combines the information of the %F, %N and %W indices (Hyslop, 1980).

### diet_proportions.R

diet_proportions.R computes the %F, %N, %W and %IRI indices for the input data and exports indices values as a .csv file. The %N, %W and %IRI values for the prey taxa are also plotted as pie-donut graphs that are exported as .png files. pie-donut graphs present in a single plot the proportions or relative importance in the diet of a predator of the prey taxa (a) individually in the outer "donut" part and (b) aggregated into predefined categories in the inner "pie" part of the plot.

![%N pie-donut plot](/piedonut_N.png "%N pie-donut plot")

### pie_donut_full.R

Definition of the pie_donut_full() function that plots the pie-donut graphs. It is an adaptation of the version of the function that was posted on [stackoverflow](https://stackoverflow.com/questions/68095243/piedonut-how-to-change-color-of-pie-and-donut) by Amélie Gourdon-Kanhukamwe. In the present version, the colors of prey categories are defined by the user and maintained across plots.

## Modified Costello graph

The Costello graph as modified by Amudsen et al. (1996) plots prey-specific abundance of prey taxa against their frequency of occurrence in the stomachs with food contents. The method assesses simultaneously the prey importance, the feeding strategy, and the inter- and intra-individual components of trophic niche width. This information is obtained by the examination of the distribution of the points representing prey categories in the produced plots across the bottom left-top right diagonal (rare vs. dominant prey categories), top-bottom axis (specialization vs. generalization in the diet), and top left-top right axis (specialization at the individual vs. at the population level).

### mod_Costello.R

mod_Costello.R produces and exports in a .png file the modified Costello plot for the input data.

![modified Costello plot](/mod_Costello.png "modified Costello plot")

## References

Amundsen, P.-A., Gabler, H.-M., Staldvik, F.J. (1996) A new method for graphical analysis of feeding strategy from stomach contents data. J. Fish Biol. 48: 607–614.

Hyslop, J. (1980) Stomach content analysis: a review of methods and their application. J. Fish Biol. 17: 411−429.




