library(ggplot2)
library(dplyr)
library(data.table)
library(hrbrthemes)
library(viridis)
setwd ("C:/Users/twlodarczyk/Desktop/All documents/R")
df <- read.delim("chemia.txt")
df

df2 <- cbind(df, c(10,11))




#p <- ggplot(df, aes(x=pH, y=population)) + 
#geom_boxplot()
#p

#This one works:
d<- ggplot(df, aes(x=population, y=pH, fill=population))+
  geom_boxplot() +
  scale_fill_manual(df$population,
                   values = c("#1b98e0", "#353436", "yellow", "green"))
d



#d<- ggplot(df, aes(x=population, y=pH, fill=population))+
#  geom_boxplot(width=0.9,lwd=0.5, aes(color=population)) +
#  geom_jitter(width=0.85,aes(color=population)) +
#d


e <- ggplot(df, aes(x=site_name, y=Zn_tot, fill=site_name))+
  geom_bar(stat="identity", position="dodge")
e
