library(ggplot2)
library(viridis)

head(mtcars)


ggplot(data = mtcars, aes(x = wt, y = mpg, color = factor(cyl))) +
    geom_point() +
    theme_bw() +
    ggtitle("Miles per Gallon based on Car Weight") +
    ylab("Miles/(US) gallon") +
    xlab("Weight (1000 lbs)") +
    xlim(0, NA) + ylim(0, NA) +
    scale_color_viridis(discrete = TRUE, name = "Number of cylinders") +
    theme(legend.position = "bottom")

