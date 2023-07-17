
#' Convert numeric values to a different scale
#'
#' @param x A vector of numeric values
#'
#' @return The vector of numeric values converted to the appropriate scale
#' @export
#' @examples
#' lb2kg(1:10)
#' kg2lb(1:10)


#' @describeIn scale Convert from pounds to kilograms
#' @export
lb2kg <- function(x) x*0.453592

#' @describeIn scale Convert from pounds to metric tons
#' @export
lb2mt <- function(x) lb2kg(x) %>% divide_1000()


#' @describeIn scale Convert from kilograms to pounds
#' @export
kg2lb <- function(x) x/0.453592

#' @describeIn scale Convert from kilograms to 1000 pounds
#' @export
kg2_1000lb <- function(kg) kg*2.205 / 1000

#' @describeIn scale Convert from kilograms to metric tons
#' @export
kg2mt <- function(x) divide_1000(x)

#' @describeIn scale Convert from inches to millimeters
#' @export
inch2mm <- function(x) x*25.4

#' @describeIn scale Convert from inches to centimeters
#' @export
inch2cm <- function(x) inch2mm(x) %>% divide_10()

#' @describeIn scale Convert from millimeters to inches
#' @export
mm2inch <- function(x) x/25.4

#' @describeIn scale Convert from centimeters to inches
#' @export
cm2inch <- function(x) mm2inch(x) %>% multiply_10()


#' @describeIn scale Divide values by 1000
#' @export
divide_1000 <- function(x) x/1000

#' @describeIn scale Divide values by 100
#' @export
divide_100 <- function(x) x/100

#' @describeIn scale Divide values by 10
#' @export
divide_10 <- function(x) x/10

#' @describeIn scale Multiply values by 1000
#' @export
multiply_1000 <- function(x) x*1000

#' @describeIn scale Multiply values by 100
#' @export
multiply_100 <- function(x) x*100

#' @describeIn scale Multiply values by 10
#' @export
multiply_10 <- function(x) x*10




