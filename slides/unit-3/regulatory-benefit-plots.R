## Attach required packages
library(ggplot2)
# library(ggpubr)

## Define data
effort = seq(from = 0, to = 1, by = 0.01)
dat = data.frame(
    effort = rep(effort, 2),
    group  = rep(c("Solo", "Together"), each = length(effort)),
    utility = c(effort - 2 * effort, 1 + effort - 1.5 * effort)
)

## Plot basic result
map = aes(x = effort, y = utility, color = group, linetype = group)
pal = c(Solo = "#d55e00", Together = "#0072b2")
lty = c(Solo = "solid", Together = "dashed")
plt = ggplot(data = dat, mapping = map) +
    geom_line(linewidth = 1) +
    xlab("Cleaning Effort") + ylab("Net Benefit") +
    scale_color_manual(values = pal, name = "") +
    scale_linetype_manual(values = lty, name = "") +
    theme_bw() +
    theme(
        axis.text  = element_blank(),
        axis.ticks = element_blank(),
        legend.key.width = unit(1, "cm")
    )
ggsave(
    plot = plt,
    filename = "slides/unit-3/roommates1.png",
    width = 1350,
    height = 760,
    units = "px"
)

## Plot result showing regulatory benefit
plt = ggplot(data = dat, mapping = map) +
    geom_line(linewidth = 1) +
    geom_hline(yintercept = 0.0, linetype = "dotted", color = "#d55e00") +
    geom_hline(yintercept = 0.5, linetype = "dotted", color = "#0072b2") +
    geom_segment(
        x = 0.25, y = 0, yend = 0.5,
        linewidth = 0.75, color = "#228b22",
        inherit.aes = FALSE
    ) +
    annotate(
        x = 0.4, y = 0.25,
        geom = "label", label = "Regulatory benefit",
        hjust = 0.2, label.size = 0
    ) +
    xlab("Cleaning Effort") + ylab("Net Benefit") +
    scale_color_manual(values = pal, name = "") +
    scale_linetype_manual(values = lty, name = "") +
    theme_bw() +
    theme(
        axis.text  = element_blank(),
        axis.ticks = element_blank(),
        legend.key.width = unit(1, "cm")
    )
ggsave(
    plot = plt,
    filename = "slides/unit-3/roommates2.png",
    width = 1350,
    height = 760,
    units = "px"
)
