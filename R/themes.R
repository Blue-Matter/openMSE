# modified from theme_pbs in gfplot!!

#' A ggplot2 theme
#'
#' A simple theme for ggplot2 that loosely resembles nicely themed plots from
#' base graphics.
#'
#' @param base_size Base font size.
#' @param base_family Base font family.
#' @param text_col Color for text.
#' @param panel_border_col Color for panel borders.
#'
#' @examples
#' p <- ggplot2::ggplot(mtcars) +
#'   ggplot2::geom_point(ggplot2::aes(x = wt, y = mpg, colour = factor(gear))) +
#'   ggplot2::facet_wrap(~am)
#' p + theme_default()
#'
#' @export
theme_default <- function(base_size = 11, base_family = "", text_col = "grey20",
                      panel_border_col = "grey70") {
  half_line <- base_size / 2
  theme_light(base_size = base_size, base_family = "") +
    theme(

      axis.ticks.length = unit(half_line / 2.2, "pt"),
      strip.background = element_rect(fill = NA, colour = NA),
      strip.text.x = element_text(colour = text_col, size=rel(1.4),face="bold"),
      strip.text.y = element_text(colour = text_col, size=rel(1.4),face="bold"),
      axis.title.x = element_text(size=rel(1.4),face="bold"),
      axis.title.y = element_text(size=rel(1.4),face="bold"),
      axis.text.x = element_text(size=rel(1.09),face="bold", angle=90, vjust=0.5, hjust=1),
      axis.text.y = element_text(size=rel(1.09),face="bold"),
      axis.text = element_text(colour = text_col),
      axis.title = element_text(colour = text_col),
      legend.title = element_text(colour = text_col, size = rel(0.9)),
      panel.border = element_rect(fill = NA, colour = panel_border_col, linewidth = 1),
      legend.key.size = unit(0.9, "lines"),
      legend.text = element_text(size = rel(1), colour = text_col),
      legend.key = element_rect(colour = NA, fill = NA),
      legend.background = element_rect(colour = NA, fill = NA),
      plot.title = element_text(colour = text_col, size = rel(1.8)),
      plot.subtitle = element_text(colour = text_col, size = rel(.85))
    )
}


