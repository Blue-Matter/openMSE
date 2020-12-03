library(openxlsx)
library(dplyr)
library(stringi)

# --- Setup ----
base.dir <- 'content'
structure <- openxlsx::read.xlsx('build_site/directory_structure.xlsx')


# ---- Functions ----
replace_line <- function(str, val, exist.txt) {
  ind <- which(!is.na(stringi::stri_match(exist.txt, regex=str)))
  if (length(ind)>0)
    exist.txt[ind] <- paste0(str,': ',  val)
  exist.txt
}

# write YAML
writeYAML <- function(file, structure, i) {
  exist.txt <- stringi::stri_read_lines(file)
  empty <- FALSE
  if (all(nchar(exist.txt)==0)) empty <- TRUE

  # date
  date <- format(Sys.time(), "%Y-%m-%dT%H:%M:%S+06:00")
  date <- paste0('"', date, '"')

  # description
  dec <- structure$Description[i]

  # icon
  icon <- structure$Icon[i]

  # title
  if (is.na(structure$Child[i])) {
    title <- structure$Parent[i]
  } else {
    title <- structure$Child[i]
  }

  # type
  type <- structure$Type[i]

  # weight
  weight <- structure$Weight[i]

  # write lines
  if (empty) {
    cat('---',  '\n', file=file, append = TRUE)
    cat('date:',  date, '\n', file=file, append = TRUE)
    if (!is.na(dec)>0) cat('description: ', dec, '\n', file=file, append = TRUE)
    if (!is.na(icon)) cat('icon: ', icon,  '\n', file=file, append = TRUE)
    cat('title: ', title,  '\n',file=file, append = TRUE)
    if (!is.na(type)) cat('type: ', type, '\n', file=file, append = TRUE)
    cat('weight: ', structure$Weight[i],  '\n', file=file, append = TRUE)
    cat('---',  '\n', file=file, append = TRUE)
  } else {
    # replace the YAML
    exist.txt <- replace_line('date', date, exist.txt)
    exist.txt <- replace_line(str='description', val=dec, exist.txt)
    exist.txt <- replace_line('icon', icon, exist.txt)
    exist.txt <- replace_line('title', title, exist.txt)
    exist.txt <- replace_line('type', type, exist.txt)
    exist.txt <- replace_line('weight', weight, exist.txt)
    stringi::stri_write_lines(exist.txt, file)
  }

}

# ---- Loop over rows in directory_structure.xlsx
for (i in 1:nrow(structure)) {
  Parent <- structure$Parent[i] %>% tolower() %>% gsub(' ', "-",.)

  parent.dir <- file.path(base.dir, Parent)
  if (!dir.exists(parent.dir)) dir.create(parent.dir)

  # create parent index
  index <- file.path(parent.dir, "_index.en.md")
  index2 <- gsub('.md', '.rmd', index)
  if (file.exists(index2)) index <- index2
  if (!file.exists(index)) file.create(index)

  Child <- structure$Child[i] %>% tolower() %>% gsub(' ', "-",.)
  Child <- gsub("?", '', Child, fixed=TRUE)
  child.dir <- file.path(parent.dir, Child)
  if (!is.na(Child)) {
    if (!dir.exists(child.dir)) dir.create(child.dir)
    index <- file.path(child.dir, "_index.en.md")
    index2 <- gsub('.md', '.rmd', index)
    if (file.exists(index2)) index <- index2
    if (!file.exists(index)) file.create(index)
  }

  writeYAML(index, structure, i)

}




