#data preprocessing

m1<-read.csv("Section6-Homework-Data.csv")
getwd()
setwd("C:\\Users\\pavit\\Documents\\R\\R scripts\\5ggplot")
colnames(m1)<-c("A","B","Genere","C","D","Studio","E",
"Budget","H","I","J","K","L","M","N","O","P","Gross")
head(m1)
factor(m1$Studio)

#filter

f1<-(m1$Genere=="action")|(m1$Genere=="adventure")|(m1$Genere=="animation")|
  (m1$Genere=="comedy")|(m1$Genere=="drama")

f2<-m1$Studio %in% c("Buena Vista Studios","Fox","Paramount Pictures","Sony","Universal","WB")

#data

m2<-m1[f1&f2,]
m2

#plot

a<-ggplot(data = m2,aes(x=Genere,y=Gross))
a

#add geom

b<-a+
  geom_jitter(aes(size=Budget,color=Studio))+
  geom_boxplot(alpha=0.7,outlier.color = NA)

#theme

b<-b+
  xlab("Genere")+ylab("Gross % US")+
  ggtitle("Domestic Gross % by Genere")

#fonts
install.packages("extrafont")
library(extrafont)
font_import()
loadfonts(device="win")
fonts()

# boxes

b$labels$size<-"Budget $M"

#final theme

b<-b+
  theme(axis.title.x = element_text(color="Blue",size=20),
        axis.title.y = element_text(color="Blue",size=20),
        axis.text.x=element_text(size = 20),
        axis.text.y=element_text(size = 20),
        legend.title = element_text(size=20),
        legend.text = element_text(size=20),
        plot.title = element_text(size=40),
        text = element_text(family ="Comic Sans MS")
        )
b
