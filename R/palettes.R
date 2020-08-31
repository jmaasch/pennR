#' List of all palettes.
#'
#' @export
#'
penn_palettes <- list(
  "Red" = "#990000",
  "Blue" = "#011F5B",
  "Red-Blue" = c("#990000", "#011F5B"),
  "Red-Blue-White" = c("#990000", "#011F5B", "#FFFFFF"),
  "Blue 3" = c("#011F5B", "#7081A2", "#BFC7D5"),
  "Blue 5" = c("#011F5B", "#38507E", "#7081A2", "#A7B2C6", "#DFE3EA"),
  "Blue 8" = c("#011F5B", "#203B6F", "#405783", "#607398",
              "#808FAD", "#9FABC1", "#BFC7D5", "#DFE3EA"),
  "Blue-Red 3" = c("#011F5B", "#4D0F2D", "#990000"),
  "Blue-Red 5" = c("#011F5B", "#271744", "#4D0F2D", "#720716", "#990000"),
  "Blue-Red 8" = c("#011F5B", "#161A4E", "#2C1641", "#421134",
                   "#570D27", "#6D081A", "#83040D", "#990000"),
  "Red 3" = c("#990000", "#C56F6F", "#E5BFBF"),
  "Red 5" = c("#990000", "#AF3737", "#C56F6F", "#DBA7A7", "#F2DFDF"),
  "Red 8" = c("#990000", "#A51F1F", "#B23F3F", "#BF5F5F",
             "#CC7F7F", "#D89F9F", "#E5BFBF", "#F2DFDF")
)

#' Generate color palette.
#'
#' @param palette_name The short ID for the palette, e.g. "Blue 8".
#'
#' @return A vector of hexademical values.
#'
#' @examples
#' # Assign palette to a name.
#' penn_palette <- penn("Red-Blue")
#'
#' # Use with base R.
#' plot(iris$Sepal.Width,
#'      iris$Sepal.Length,
#'      col = penn("Blue 5"))
#'
#' @export
#'
penn <- function(palette_name) {

  return(penn_palettes[[palette_name]])

}

#' Generate demo plot for single palette.
#'
#' @param palette_name The short ID for the palette, e.g. "Blue 8".
#'
#' @return A ggplot2 bar plot.
#'
#' @examples
#' penn.demo("Red-Blue")
#'
#' @export
#'
penn.demo <- function(palette_name) {

  # Construct dataframe.
  if (length(penn_palettes[[palette_name]]) == 1) {
    df <- data.frame(Value = 6,
                     Label = 1)
  }
  else if (length(penn_palettes[[palette_name]]) == 2) {
    df <- data.frame(Value = c(4, 6),
                     Label = c(1, 2))
  }
  else if (palette_name == "Red-Blue-White") {
    df <- data.frame(Value = c(3, 3, 3),
                     Label = c(1, 2, 3))
  }
  else if (length(penn_palettes[[palette_name]]) == 3) {
    df <- data.frame(Value = c(4, 6, 9),
                     Label = c(1, 2, 3))
  }
  else if (length(penn_palettes[[palette_name]]) == 5) {
    df <- data.frame(Value = c(4, 6, 3, 7, 9),
                     Label = c(1, 2, 3, 4, 5))
  }
  else if (length(penn_palettes[[palette_name]]) == 8) {
    df <- data.frame(Value = c(4, 6, 3, 7, 2, 5, 8, 9),
                     Label = c(1, 2, 3, 4, 5, 6, 7, 8))
  }
  df$Label <- as.factor(df$Label)

  # Generate plot.
  # If palette is 1, 2, or 3 values long:
  if (length(penn_palettes[[palette_name]]) <= 2 || palette_name == "Red-Blue-White") {
    if (length(penn_palettes[[palette_name]]) == 1) {
      line_color <- penn_palettes[[palette_name]][1]
    }
    else {
      line_color <- "#990000"
    }
    pie <- ggplot2::ggplot(df,
                           ggplot2::aes(x = "",
                                        y = Value,
                                        fill = Label)) +
          ggthemes::theme_tufte() +
          ggplot2::geom_bar(stat = "identity",
                            width = 1,
                            color = line_color) +
          ggplot2::coord_polar("y",
                               start = 0) +
          ggplot2::scale_fill_manual(values = penn_palettes[[palette_name]],
                                     labels = penn_palettes[[palette_name]]) +
          ggplot2::theme(axis.text = ggplot2::element_blank(),
                         axis.ticks = ggplot2::element_blank(),
                         plot.title = ggplot2::element_text(face = "bold")) +
          ggplot2::labs(x = "",
                        y = "",
                        fill = "",
                        title = palette_name)
    return(invisible(pie))
  }
  # Else:
  bar <- ggplot2::ggplot(df,
                         ggplot2::aes(x = Label,
                                      y = Value)) +
        ggplot2::geom_bar(stat = "identity",
                          position = "dodge",
                          ggplot2::aes(fill = Label)) +
        ggthemes::theme_tufte() +
        ggplot2::scale_fill_manual(values = penn_palettes[[palette_name]],
                                   labels = penn_palettes[[palette_name]]) +
        ggplot2::theme(axis.title.x = ggplot2::element_blank(),
                       axis.title.y = ggplot2::element_blank(),
                       legend.title = ggplot2::element_blank(),
                       plot.title = ggplot2::element_text(face = "bold",
                                                          size = 16)) +
        ggplot2::labs(title = palette_name)

  return(invisible(bar))

}

#' Generate demo plot for all palettes.
#'
#' @return A list of ggplot2 bar plots.
#'
#' @examples
#' penn.demo.all()
#'
#' @export
#'
penn.demo.all <- function() {

  # Init empty list for plots.
  plot_list <- vector("list", 13)
  i <- 1

  # Loop through all palettes.
  for (palette in names(penn_palettes)) {

    current_plot <- penn.demo(palette)

    # Update plot list.
    plot_list[[i]] <- current_plot
    i <- i + 1

    print(current_plot)

  }

  return(invisible(plot_list))

}

# Define global variables.
utils::globalVariables(c("Label", "Value"))
