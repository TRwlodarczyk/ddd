
library(sjPlot)

library(stargazer)
library(DT)

setwd("C:/Users/twlodarczyk/Desktop/All documents/1 PhD/Meetings/Conferences/CNRS OHM PIMA")
dt <- read.table("lod.txt", sep = "\t", header = T)
dt

tab_df(dt, file="halo.doc")

