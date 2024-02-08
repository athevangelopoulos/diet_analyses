# diet_analyses

Species diet data analyses

## Prey taxa proportions and their relative importance in the diet of a predator

The proportions of prey taxa in the diet of a predator are usually given as their frequencies in the stomachs (%F) and their proportions in numbers (%N) and weight (%W) in the stomach contents. Prey relative importance is estimated with the Index of Relative Importance (%IRI) that combines the information of the %F, %N and %W indices (Hyslop, 1980).

### diet_proportions.R

diet_proportions.R computes the %F, %N, %W and %IRI indices for the input data and exports index values as a .csv file. The %N, %W and %IRI values are also plotted as pie-donut graphs and exported as .png files. pie-donut graphs present in a single plot the proportions of prey taxa individually in the outer "donut" part and aggregated into categories in the inner "pie" part of the plot.

### pie_donut_full.R

Definition of the pie_donut_full() function that plots the pie-donut graphs. It is an adaptation of the [version](https://stackoverflow.com/questions/68095243/piedonut-how-to-change-color-of-pie-and-donut) of the function that was posted on stackoverflow by Amélie Gourdon-Kanhukamwe. In the present version, the colors of prey categories are defined by the user and maintained across plots.

## Modified Costello graph

The Costello graph as modified by Amudsen et al. (1996) plots prey-specific abundance of prey taxa against their frequency of occurrence in the stomachs with food contents.

### mod_Costello.R

mod_Costello.R produces and exports in a .png file the modified Costello plot for the input data.

## References

Amundsen, P.-A., Gabler, H.-M., Staldvik, F.J. (1996) A new method for graphical analysis of feeding strategy from stomach contents data. J. Fish Biol. 48: 607–614.

Hyslop, J. (1980) Stomach content analysis: a review of methods and their application. J. Fish Biol. 17: 411−429.




