
library(ggplot2)
library(dplyr)
library(data.table)
library(reshape2)
library(reshape)

setwd ("C:/Users/twlodarczyk/Desktop/All documents/PhD/CNRS + Synch/Field/Data/Data SX 04.15.22")
dt <- read.csv2("SX_DATA_04.15.22_R.csv", header = T, sep = ",")
dt


dt1 <- gsub(".*ND.*", 0, dt[,7])
dt1

tr <- matrix(data = NA, ncol = ncol(dt[,c(1:21)]), nrow=nrow(dt))
colnames(tr) <- colnames(dt[,c(1:21)])
for (i in 7:21)
{
  tr[,c(i)] <- gsub(".*ND.*", 0, dt[,i])
}

for(i in 1:6)
    {
      tr[,c(i)] <- dt[,c(i)]
    }
tr   

typeof(tr$Ni) # error, not for dt$Ni
    

# to check if variables are numeric or character
#sapply(tr, class)



#cols.num <- c("Cr","Mn", "Fe", "Co", "Ni", "Cu", "Zn", "As", "Se", "Rb", "Cd", "Re", "Hg", "TI", "Pb")
#cols.num <- c("Ni")
#tr[cols.num] <- sapply(tr[cols.num],as.numeric)
#sapply(tr, class)

#tr[,6:21] <- sapply(tr[,6:21],as.numeric)

typeof(tr$Ni) # shows error, because we have a vector, not a dataframe
is.atomic(tr) # not is true, as we have a vector
data_x <- as.data.frame(t(tr)) # convert data to dataframe
is.atomic(data_x) # now is true




tr <- as.data.frame.matrix(tr) #POPRAWNA KOMENDA zamiany vectora 
tr[,7:21] <- sapply(tr[,7:21],as.numeric) # zamien character na numeric

is.atomic(tr)
typeof(tr$Ni)



# melt data to have variable column with elements. File column is broken.

mtr <- melt(tr, id=c("Material", "Sample", "Plot", "Optimization", "Method", "ï..File"))


mtr_plants <- subset(mtr, Material=="Plant")
mtr_plants2 <- subset(mtr_plants, variable!="Fe")
mtr_plants3 <- subset(mtr_plants2, variable!="Cr")
mtr_plants4 <- subset(mtr_plants3, variable!="Hg")
mtr_plants5 <- subset(mtr_plants4, variable!="TI")
mtr_plants6 <- subset(mtr_plants5, variable!="Cd")
mtr_plants7 <- subset(mtr_plants6, variable!="Rb")
mtr_plants8 <- subset(mtr_plants7, variable!="Zn")
mtr_plants9 <- subset(mtr_plants8, variable!="Ni")
mtr_plants10 <- subset(mtr_plants9, variable!="Pb")
mtr_plants11 <- subset(mtr_plants10, variable!="Co")


mtr_plants_Zn <- subset(mtr_plants, variable=="Zn")


Zn<-ggplot(data=mtr_plants_Zn, aes(x=Sample, y=value, fill=variable)) +
  geom_bar(stat="identity", position=position_dodge()) +
  geom_errorbar(aes(ymin=value-sd(value), ymax=value + sd(value)), position=position_dodge())+
  theme_bw()+
  labs(title="Elemental concentrations in plants")+
  scale_x_discrete(guide = guide_axis(angle = 45))+
  theme(panel.grid.major.x = element_blank())


Zn


p<-ggplot(data=mtr_plants11, aes(x=Sample, y=value, fill=variable)) +
  geom_bar(stat="identity", position=position_dodge()) +
  geom_errorbar(aes(ymin=value-sd(value), ymax=value + sd(value)), position=position_dodge())+
  theme_bw()+
  labs(title="Elemental concentrations in plants")+
  scale_x_discrete(guide = guide_axis(angle = 45))+
  theme(panel.grid.major.x = element_blank())

p



#  stat_summary(fun.data = "mean_cl_boot") +


# nicer table for soil


library(sjPlot)

library(stargazer)
library(DT)



setwd ("C:/Users/twlodarczyk/Desktop/All documents/PhD/CNRS + Synch/Field/Data")
dt <- read.table("Soil_SX_04.15.22.txt", sep = "\t", header = T)

tab_df(dt, file="Soil_SX_04.15.22.doc")
