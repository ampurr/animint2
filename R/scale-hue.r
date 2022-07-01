#' Qualitative colour scale with evenly spaced hues.
#'
#' @param aesthetic Name of the aesthetic column to put the value into
#' @param na.value Colour to use for missing values
#' @param ... Other arguments passed on to \code{\link{discrete_scale}}
#'   to control name, limits, breaks, labels and so forth.
#' @inheritParams scales::hue_pal
#' @rdname scale_hue
#' @export
#' @seealso Other colour scales:
#'   \code{\link{scale_colour_brewer}},
#'   \code{\link{scale_colour_gradient}},
#'   \code{\link{scale_colour_grey}}
#' @examples
#' \donttest{
#' dsamp <- diamonds[sample(nrow(diamonds), 1000), ]
#' (d <- ggplot(dsamp, aes(carat, price)) + geom_point(aes(colour = clarity)))
#'
#' # Change scale label
#' d + scale_colour_hue()
#' d + scale_colour_hue("clarity")
#' d + scale_colour_hue(expression(clarity[beta]))
#'
#' # Adjust luminosity and chroma
#' d + scale_colour_hue(l = 40, c = 30)
#' d + scale_colour_hue(l = 70, c = 30)
#' d + scale_colour_hue(l = 70, c = 150)
#' d + scale_colour_hue(l = 80, c = 150)
#'
#' # Change range of hues used
#' d + scale_colour_hue(h = c(0, 90))
#' d + scale_colour_hue(h = c(90, 180))
#' d + scale_colour_hue(h = c(180, 270))
#' d + scale_colour_hue(h = c(270, 360))
#'
#' # Vary opacity
#' # (only works with pdf, quartz and cairo devices)
#' d <- ggplot(dsamp, aes(carat, price, colour = clarity))
#' d + geom_point(alpha = 0.9)
#' d + geom_point(alpha = 0.5)
#' d + geom_point(alpha = 0.2)
#'
#' # Colour of missing values is controlled with na.value:
#' miss <- factor(sample(c(NA, 1:5), nrow(mtcars), replace = TRUE))
#' ggplot(mtcars, aes(mpg, wt)) + geom_point(aes(colour = miss))
#' ggplot(mtcars, aes(mpg, wt)) +
#'   geom_point(aes(colour = miss)) +
#'   scale_hue("colour", na.value = "black")
#' }
scale_hue <- function(aesthetic, ..., h = c(0, 360) + 15, c = 100, l = 65, h.start = 0, direction = 1, na.value = "grey50") {
  discrete_scale(aesthetic, "hue", hue_pal(h, c, l, h.start, direction),
    na.value = na.value, ...)
}


#' @rdname scale_hue
#' @export
scale_colour_hue <- function(...) {
  scale_hue("colour", ...)
}

#' @rdname scale_hue
#' @export
scale_colour_off_hue <- function(...) {
  scale_hue("colour_off", ...)
}

#' @rdname scale_hue
#' @export
scale_fill_hue <- function(...) {
  scale_hue("fill", ...)
}

#' @rdname scale_hue
#' @export
scale_fill_off_hue <- function(...) {
  scale_hue("fill_off", ...)
}
