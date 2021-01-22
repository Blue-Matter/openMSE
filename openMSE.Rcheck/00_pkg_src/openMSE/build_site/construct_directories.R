library(openxlsx)
library(dplyr)
library(stringi)

# --- Setup ----
base.dir <- 'content'



# ---- Functions ----
replace_line <- function(str, val, new.txt) {
  if (str == 'keywords') {
    ind <- which(!is.na(stringi::stri_match(new.txt, regex=str)))
    end <- which(!is.na(stringi::stri_match(new.txt, regex='---')))[2]
    n.kw <- end - ind - 1

    words <- unique(strsplit(val, ",")[[1]])
    n.nkw <- length(words)
    if (is.na(val)) n.nkw=0

    if (n.kw == n.nkw && n.kw>0) {
      # replace
      new.txt[(ind+1):(end-1)] <- paste0("- ", words)
    } else {
      new.lines <- n.nkw - n.kw
      if (new.lines>0) {
        # add lines
        new.txt[(end+new.lines):(length(new.txt)+new.lines)] <- new.txt[end:length(new.txt)]

        new.txt[(ind+(1:(1+new.lines)))] <- paste0("- ", words)
      } else if (new.lines<0) {
        new.txt[(ind+(1:(n.nkw)))] <- paste0("- ", words)
        ind2 <- ind+1+(1:abs(new.lines))
        new.txt <- new.txt[-ind2]
      }
    }
  } else {
    ind <- which(!is.na(stringi::stri_match(new.txt, regex=str)))
    if (length(ind)>0)
      new.txt[ind] <- paste0(str,': ',  val)
  }

  new.txt
}

# write YAML
writeYAML <- function(index, structure, i) {
  exist.txt <- stringi::stri_read_lines(index)
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
    cat('---',  '\n', file=index, append = TRUE, sep="")
    cat('date: ',  date, '\n', file=index, append = TRUE, sep="")
    if (!is.na(dec)>0) cat('description: ', dec, '\n', file=index, append = TRUE, sep="")
    if (!is.na(icon)) cat('icon: ', icon,  '\n', file=index, append = TRUE, sep="")
    cat('title: ', title,  '\n',file=index, append = TRUE, sep="")
    if (!is.na(type)) cat('type: ', type, '\n', file=index, append = TRUE, sep="")
    cat('weight: ', structure$Weight[i],  '\n', file=index, append = TRUE, sep="")
    cat('keywords: ',  '\n', file=index, append = TRUE, sep="")
    if (!is.na(structure$Keywords[i])>0) {
      kw <- structure$Keywords[i]
      words <- unique(strsplit(kw, ",")[[1]])
      for (j in seq_along(words)) {
        word <- trimws(words[j])
        cat('- ', word,  '\n', file=index, append = TRUE, sep="")
      }
    }
    cat('---',  '\n', file=index, append = TRUE, sep="")
  } else {
    # replace the YAML
    new.txt <- exist.txt
    new.txt <- replace_line(str='description', val=dec, new.txt)
    new.txt <- replace_line('icon', icon, new.txt)
    new.txt <- replace_line('title', title, new.txt)
    new.txt <- replace_line('type', type, new.txt)
    new.txt <- replace_line('weight', weight, new.txt)
    new.txt <- replace_line('keywords',val=structure$Keywords[i], new.txt)

    update <- FALSE
    if (length(new.txt)!= length(exist.txt)) update <- TRUE
    if (update || !all(trimws(new.txt) ==  trimws(exist.txt))) {
      # update the date and text
      new.txt <- replace_line('date', date, new.txt)
      stringi::stri_write_lines(new.txt, index)
    }
  }
}

# ---- Loop over rows in directory_structure.xlsx
structure <- openxlsx::read.xlsx('build_site/directory_structure.xlsx')
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




