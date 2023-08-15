#!/usr/binenv Rscript
library(UpSetR)
library(RColorBrewer)

# Read in binary table
binary <- read.csv("RIL2_1to8_binary.csv", sep="\t", header =TRUE, row.names = 1)


## Make upsetplot ##
z <- unlist(c("A123.0", "EG4.1", "RIL2_1", "RIL2_2", "RIL2_1.8")) # RIL lines you want to look at

data <- binary[ , c(z)]
data

#x <- as.matrix(binary)
brew.colors <- brewer.pal(6,"Dark2") #this just gets a list of default colors for me to put in for "col1, col2" etc. below - the default colors sometimes look too similar)

col1 <- "darkolivegreen3"
col2 <- "darkorchid2"
col3 <- "#FF96C5"
col4 <- "#00A5E3"
col5 <- "coral2"

upset(binary, keep.order = FALSE, nsets=4, nintersects = NA,mb.ratio = c(0.7, 0.3), sets = NULL, matrix.color = "black", show.numbers = FALSE, point.size = 2,  line.size = 0.5,query.legend = "top", mainbar.y.label = "Shared mPing", order.by = c('freq'), decreasing = c(TRUE, TRUE), text.scale = c(1.3, 1.3, 1.3, 1.5, 2, 1), sets.bar.color=c("darkolivegreen3","darkolivegreen3","darkolivegreen3","coral2"), 
      queries = list(
        list(query = intersects, params = list("A123.0", "EG4.1") ,color = col1, active = T, query.name = "Only Parentals"),
        list(query = intersects, params = list("A123.0", "EG4.1", "RIL2_1.8"), color = col2, active = T, query.name = "Parentals and all RILs"),
        list(query = intersects, params = list("EG4.1", "RIL2_1.8"), color = col5, active = T, query.name = "EG4 and all RILs"),
        list(query = intersects, params = list("RIL2_1", "RIL2_2"), color = col4, active = T, query.name = "Individual RILs")))

#note: text.scale = c(intersection size title, intersection size tick labels, set size title, set size tick labels, set names, numbers above bars)


# Test
my_queries <- list(
        list(query = intersects, params = list("A123.0", "EG4.1") ,color = col1, active = T, query.name = "Only Parentals"),
        list(query = intersects, params = list("A123.0", "EG4.1", "RIL2_1.8"), color = col2, active = T, query.name = "Parentals and all RILs"),
        list(query = intersects, params = list("EG4.1", "RIL2_1.8"), color = col5, active = T, query.name = "EG4 and all RILs"),
        list(query = intersects, params = list("RIL2_1", "RIL2_2"), color = col4, active = T, query.name = "Individual RILs"))



print(binary)

## WORKING CODE ## 
query_list <- list(
  list(sets = c("A123.0", "EG4.1"), color = "#FF5733"),
  list(sets = c("RIL2_1", "RIL2_2", "RIL2_3"), color = "#008080")
)
library(UpSetR)
library(RColorBrewer)

#reading in data
binary <- read.csv("RIL2_1to8_binary.csv", sep="\t", header =TRUE, row.names = 1)

upset(binary, keep.order=TRUE, nsets=4, nintersects=10,
      sets=c("A123.0", "EG4.1", "RIL2_1", "RIL2_2", "RIL2_3", "RIL2_4", "RIL2_5", "RIL2_6", "RIL2_7", "RIL2_8"), matrix.color="black", show.numbers="yes",
      point.size=2, line.size=0.5, 
      query.legend="top", mainbar.y.label="Shared mPing", 
      order.by=c('freq'), decreasing=c(TRUE, TRUE), 
      text.scale=c(1.3, 1.3, 1.3, 1.5, 2, 1))



## More Testing ## 
my_query <- list(query = intersects, params = list("A123.0", "EG4.1", "RIL2_1.8"), color = "blue", active = TRUE, query.name = "My Query")



library(UpSetR)
library(RColorBrewer)

#reading in data
binary <- read.csv("RIL2_1to8_binary.csv", sep="\t", header =TRUE, row.names = 1)

upset(binary, keep.order=TRUE, nsets=4, nintersects=10,
      sets=c("A123.0", "EG4.1", "RIL2_1", "RIL2_2", "RIL2_3", "RIL2_4", "RIL2_5", "RIL2_6", "RIL2_7", "RIL2_8"), 
      matrix.color="black", show.numbers="yes",
      point.size=2, line.size=0.5,
      query.legend="bottom", mainbar.y.label="Shared mPing",
      order.by=c('freq'), decreasing=c(TRUE, TRUE),
      text.scale=c(1.3, 1.3, 1.3, 1.5, 2, 1),
      main="My UpSet Plot", cex.main=2, fill=brewer.pal(4, "Set2"),
      xlab="", width=10, height=8, border=NA,
      set.metadata=list("A123.0"="Set A", "EG4.1"="Set B", "RIL2_1"="Set C", "RIL2_2"="Set D",
                         "RIL2_3"="Set E", "RIL2_4"="Set F", "RIL2_5"="Set G", "RIL2_6"="Set H",
                         "RIL2_7"="Set I", "RIL2_8"="Set J"),
      intersections.metadata=list("101"="Intersection 1", "011))


