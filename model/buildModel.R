##Building prediction model on IRIS data set

library(caret)
load("data/iris.RData")
inTrain <- createDataPartition(iris$Species,p=0.7,list=FALSE)
ctrl <- trainControl(method="cv",p=0.75,number = 10)
training <- iris[inTrain,]
testing <- iris[-inTrain,]
model <- train(Species ~ Petal.Length + Petal.Width,data=iris,method="rpart",trControl=ctrl)
inPred <- predict(model,training)
outPred <- predict(model,testing)
cmIn <- confusionMatrix(training$Species,inPred)
cmOut <- confusionMatrix(testing$Species,outPred)
cmIn$byClass[,c(1,2,8)]
cmOut$byClass[,c(1,2,8)]
save(model,file="data/model.RData")
