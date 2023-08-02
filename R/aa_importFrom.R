utils::globalVariables(c("Class", "Fleet", "Lower", 'MP', 'Median',
                         'Model', 'Period', 'Upper', 'Value', 'Variable',
                         'Year', 'alpha', 'colpalette', '.',
                         'value', 'variable', 'st', 'Sim', 'Age', 'Stock',
                         'At_Age_TS_Variables', 'TS_Variables'
                         ))



#' @importFrom dplyr %>% all_of bind_rows distinct filter group_by join_by left_join mutate rename summarize
#' @importFrom ggplot2 aes element_rect element_text expand_limits facet_grid facet_wrap ggplot geom_line geom_ribbon geom_vline guides labs rel scale_color_brewer scale_x_discrete scale_fill_brewer theme theme_light
#' @importFrom grid unit
#' @importFrom purrr map2_df
#' @importFrom stats median quantile
#' @importFrom utils globalVariables head tail
NULL
