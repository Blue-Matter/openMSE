# https://github.com/GuangchuangYu/hexSticker
library(hexSticker)
library(showtext)
library(ggplot2)
library(MSEtool)
library(SAMtool)
library(DLMtool)
font_add_google("Oswald", "Oswald")


line.col <- "#e3925f"
line2.col <- "#fafafa"


OM <- testOM
OM@CAA_ESS <- c(400,400)
OM@seed <- 1001
OM@D <- c(0.8,0.85)
OM@Perr <- c(0.5,0.6)
OM@AC <- c(0,0)
OM@EffLower[4] <- 0.4
OM@EffUpper[4] <- 0.6
Hist <- Simulate(OM)
Data <- Hist@Data

MPs <- avail('MP', package='DLMtool')

MSE <- runMSE(MPs=MPs[seq(1, length(MPs), length.out = 20)])



# ---- DLMtool ----
DLMplot <- function() {
  x <- 1
  Rec <- DLMtool::AvC(x, Data)

  yrs <- min(Data@Year):(Data@Year[Data@Year==Data@LHYear[1]])
  yr.ind <- match(yrs, Data@Year)
  histCatch <- Data@Cat[x, yr.ind]
  meanC <- mean(histCatch, na.rm = T)
  lwd=4
  cex.lab=1.25

  par(bg=NA, mfrow=c(1,1))
  plot(c(Data@Year[yr.ind], Data@Year[max(yr.ind)]+1), c(histCatch,NA), type="l",
       xlab="", ylab="", lwd=lwd, bty="l", las=1,
       cex.lab=cex.lab, axes=FALSE,
       col=line.col)
  # abline(v=Data@LHYear[1], lty=2, col="darkgray") #
  # text(Data@LHYear[1], max(histCatch, na.rm=TRUE)*0.9, "Last Historical Year", pos=2, xpd=NA)
  # lines(c(min(Data@Year), Data@LHYear[1]), rep(mean(Data@Cat[x,yr.ind]),2), lty=2) #
  # text(quantile(Data@Year, 0.1), meanC*1.1, pos=4, "Average Historical Catch")
  boxplot(Rec@TAC, add=TRUE, at=max(Data@Year)+1, col=line.col, outline=FALSE,
          axes=FALSE, border=line2.col, width=1)
  # text(max(Data@Year)+1, quantile(Rec@TAC, 0.05, na.rm=TRUE), "TAC", col="black", pos=2)
}


png(file.path('build_site/img', 'DLMtool.png'))
DLMplot()
dev.off()

s <- sticker(file.path('build_site/img', 'DLMtool.png'),
             package='DLMtool', # package name
             p_size=20,
             p_y=1.4,
             p_family='Oswald',
             p_color='#fafafa',
             s_x=0.9,  # subplot
             s_y=0.8,
             s_width=0.7,
             s_height=0.7,
             h_size=2,
             h_color='#4358e0', # hex color
             h_fill='#5fa1e3',
             filename="build_site/logo/DLMtool.png")

s

# ---- SAMtool ----

SAMplot <- function() {
  x <- 2
  Assess <- SAMtool::SCA(x, Data)

  par(mfrow=c(1,1), bg=NA)
  plot(Assess@Obs_Index, col=line2.col, cex=2, pch=16, bty="n",
       xlab="", ylab="", axes=FALSE)
  lines(Assess@Index, col=line.col, lwd=3)

  # xx <- barplot(Assess@Obs_C_at_age[50,]/sum(Assess@Obs_C_at_age[50,]),
  #               col=line2.col, axes=FALSE, border=FALSE)
  # lines(xx, Assess@C_at_age[50,]/sum(Assess@C_at_age[50,]),
  #       col=line.col, lwd=4)
}

png(file.path('build_site/img', 'SAMtool.png'))
SAMplot()
dev.off()

s <- sticker(file.path('build_site/img', 'SAMtool.png'),
             package='SAMtool', # package name
             p_size=20,
             p_y=1.4,
             p_family='Oswald',
             p_color='#fafafa',
             s_x=0.9,  # subplot
             s_y=0.8,
             s_width=0.7,
             s_height=0.7,
             h_size=2,
             h_color='#4358e0', # hex color
             h_fill='#5fa1e3',
             filename="build_site/logo/SAMtool.png")

# ---- MSEtool ----

MSEplot <- function() {

  x <- P100(MSE)
  y <- LTY(MSE)

  par(mfrow=c(1,1), bg=NA)
  plot(x@Mean, y@Mean, xlim=c(0,1), ylim=c(0,1), bty="n",
       pch=16, cex=3, col=c(line.col, '#c45fe3', '#e3d45f'),
       xlab="", ylab="", axes=FALSE)
  axis(side=1, label=FALSE, col=line2.col, at=seq(0, 1, 0.25))
  axis(side=2, label=FALSE, col=line2.col, at=seq(0, 1, 0.25))
}

png(file.path('build_site/img', 'MSEtool.png'))
MSEplot()
dev.off()

s <- sticker(file.path('build_site/img', 'MSEtool.png'),
             package='MSEtool', # package name
             p_size=20,
             p_y=1.4,
             p_family='Oswald',
             p_color='#fafafa',
             s_x=1,  # subplot
             s_y=0.8,
             s_width=0.6,
             s_height=0.6,
             h_size=2,
             h_color='#4358e0', # hex color
             h_fill='#5fa1e3',
             filename="build_site/logo/MSEtool.png")

s

# ---- openMSE ----
library(igraph)
iArrows <- igraph:::igraph.Arrows

openMSEplot <- function() {

  par(mfrow=c(1,1), bg=NA)
  plot(c(0,2), c(0,2), bty="n", xlab="", ylab="", type="n",
       axes=FALSE)

  rect(0.75,1.5,1.25,2, col=line.col, border = FALSE)
  iArrows(1.25, 1.75, 1.75, 1.25, curve=1, sh.lwd=3, sh.col=line2.col)

  rect(1.5,0.75,2,1.25, col='#c45fe3', border = FALSE)
  iArrows(1.75, 0.75, 1.25, .25, curve=1, sh.lwd=3, sh.col=line2.col)

  rect(0.75,0,1.25,0.5, col='#e3d45f', border = FALSE)
  iArrows(0.75, 0.25, 0.25, .75, curve=1, sh.lwd=3, sh.col=line2.col)

  rect(0,0.75,0.5,1.25, col='#3ce6a2', border = FALSE)
  iArrows(0.25, 1.25, 0.75, 1.75, curve=1, sh.lwd=3, sh.col=line2.col)

}

png(file.path('build_site/img', 'openMSE.png'))
openMSEplot()
dev.off()


s <- sticker(file.path('build_site/img', 'openMSE.png'),
             package='openMSE', # package name
             p_size=20,
             p_y=1.4,
             p_family='Oswald',
             p_color='#fafafa',
             s_x=1,  # subplot
             s_y=0.7,
             s_width=0.6,
             s_height=0.6,
             h_size=2,
             h_color='#4358e0', # hex color
             h_fill='#5fa1e3',
             filename="build_site/logo/openMSE.png")

s

















