library(ggplot2)
library(ggrepel)

data <- read.csv("PPP.csv")
names(data) <-c("country", "region", "PPP", "labels")

ggplot(data, aes(x=region, y=PPP, color=region)) +
    geom_violin() +
    geom_jitter() +
    scale_x_discrete(limits=c(
        "North America",
         "Europe & Central Asia",
         "East Asia & Pacific",
         "Latin America & Caribbean",
         "Middle East & North Africa",
         "South Asia",
         "Sub-Saharan Africa"
     ))

ggsave("jitter.png", width=50, height=25, units="cm")


ggplot(data, aes(x=region, y=PPP, color=region)) +
    geom_violin() +
    geom_point() +
    scale_x_discrete(limits=c(
        "North America",
         "Europe & Central Asia",
         "East Asia & Pacific",
         "Latin America & Caribbean",
         "Middle East & North Africa",
         "South Asia",
         "Sub-Saharan Africa"
     )) +
    geom_text_repel(aes(label=labels))

ggsave("names.png", width=50, height=25, units="cm")
