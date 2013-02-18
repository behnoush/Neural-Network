# download.file("http://www.ggobi.org/book/data/music-all.csv", destfile="music.csv", method="curl")
d.music <- read.csv("music.csv")
music <- scale(d.music)[complete.cases(d.music), 1:10]