# multiple linear regression 
install.packages("datarium")
library(datarium)
data("marketing")
View(marketing)
str(marketing)
summary(marketing)
plot(marketing,col="red")
install.packages("ggplot2")
library(ggplot2)
splitratio=0.75
set.seed(123)
library(caTools)
sample=sample.split(marketing$youtube,SplitRatio=splitratio)
sample
train=subset(marketing,sample==TRUE)
train
test=subset(marketing,sample==FALSE)
test
train_size=dim(train)
train_size
test_size=dim(test)
test_size
model<-lm(sales~.,data=train)
summary(model)
pred<-predict(model,test)
pred
data_size=dim(marketing)
data_size
numx<-data_size[1]*(1-splitratio)
numx
x_axis<-seq(numx)
x_axis
df<-data.frame(x_axis,pred,test$sales)
df
g<-ggplot(df,aes(x=x_axis))
g
g<-g+geom_line(aes(y=pred,colour = "Predicted"))
g
g<-g+geom_point(aes(x=x_axis,y=pred,colour = "Predicted"))
g

g<-g+geom_line(aes(y=test$sales,colour = "Actual"))
g
g<-g+geom_point(aes(x=x_axis,y=test$sales,colour = "Actual"))
g
g<-g+scale_colour_manual("",values = c(Predicted="red",Actual="blue"))
g
