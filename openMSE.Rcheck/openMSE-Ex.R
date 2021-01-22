pkgname <- "openMSE"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
options(pager = "console")
library('openMSE')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
base::assign(".old_wd", base::getwd(), pos = 'CheckExEnv')
cleanEx()
nameEx("demo")
### * demo

flush(stderr()); flush(stdout())

### Name: demo
### Title: Run an example MSE
### Aliases: demo

### ** Examples

## Not run: 
##D demo()
## End(Not run)



cleanEx()
nameEx("userguide")
### * userguide

flush(stderr()); flush(stdout())

### Name: userguide
### Title: Open the openMSE Documentation website
### Aliases: userguide

### ** Examples

## Not run: 
##D userguide()
## End(Not run)



### * <FOOTER>
###
cleanEx()
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
