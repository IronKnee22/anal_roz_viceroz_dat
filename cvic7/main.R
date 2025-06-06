install.packages("class") 
library(class) 

# načtení iris dat 
data(iris) 
# rychlá explorace dat 
dim(iris) 
summary(iris) 

set.seed(13579) 
shuffle <- sample(nrow(iris), nrow(iris), replace=F) 
iris <- iris[shuffle,] 

# alternativní způsob rozdělení dat 
ind = sample(3,nrow(iris),replace=T,prob=c(0.5,0.3,0.2)) 
# vytvoření trénovací (50%), validační (30%) a testovací (20%) množiny 
trainIris <- iris[ind == 1,] 
validIris <- iris[ind == 2,] 
testIris <- iris[ind == 3,] 
# ověření velikosti množin 
dim(trainIris) 
dim(validIris) 
dim(testIris) 

# příprava hodnot parametru k 
parameter <- seq(from = 1, to = 15, by = 2); 
# příprava vektoru pro zaznamenávání hodnot klasifikační úspěšnosti 
acc <- vector(length = length(parameter)) 
for (i in 1:length(parameter)) { 
  prediction <- knn(trainIris[,-5],validIris[,-5],cl = trainIris[,5],k = 
                      parameter[i]) 
  acc[i] <- sum(prediction == validIris[,5])/nrow(validIris) 
} 
# nalezení nejlepší hodnoty k podle validační množiny 
kValidated <- parameter[which.max(acc)]

# odhad úspěšnosti klasifikace na testovací množině 
trainFull <- rbind(trainIris, validIris) 
prediction <- knn(trainFull[,-5],testIris[,-5],cl = trainFull[,5],k = 
                    kValidated) 
testAcc <- sum(prediction == testIris[,5])/nrow(testIris) 

install.packages("caret")
library(caret)

# reference by měly být skutečné třídy testovací množiny
reference <- factor(testIris[,5], levels = unique(testIris[,5]))

# Vytvoření confusion matrix
cm <- confusionMatrix(as.factor(prediction), reference)
print(cm)

## ROC
# PŘÍPRAVA DAT 
# rozdeleni dat na trenovaci a testovaci mnozinu 
library(mlbench)
data(PimaIndiansDiabetes2)
pima.data <- na.omit(PimaIndiansDiabetes2)

summary(pima.data)
set.seed(123) 
training.samples <-  sample(2,nrow(pima.data),replace=T,prob=c(0.8,0.2)) 
train.data  <- pima.data[training.samples==1, ] 
test.data <- pima.data[training.samples==2, ] 
dim(train.data) 
dim(test.data) 
# VYTVOŘENÍ MODELU 
model <- glm(diabetes ~.,family=binomial(link='logit'),data=train.data) 
summary(model)

# celkova presnost 
# Make predictions on the test data 
fitted.results <- predict(model, test.data, type="response") 
fitted.results <- ifelse(fitted.results > 0.5,"pos","neg") 
fitted.results <- factor(fitted.results, levels=c("neg","pos")) 

observed.classes <- test.data$diabetes 

accuracy <- sum(fitted.results == observed.classes)/nrow(test.data) 
accuracy

error <- sum(fitted.results != observed.classes)/nrow(test.data) 
error

confusionMatrix(fitted.results, observed.classes, pos="pos")

library(ROCR)
prob <- predict(model, test.data, type="response")
pr <- prediction(prob, test.data$diabetes)
prf <- performance(pr, measure = "tpr", x.measure = "fpr")
plot(prf, main="ROC krivka")
points(x = 0, y = 1, pch=15, col="red", cex=2)
points(x = 0.1064, y=0.6667, pch=19, col="blue", cex=2)


# krivka ucen�
# presnost na tr�novac�ch a testovac�ch datech s prib�vaj�c� mohutnost� tr�novac� mnoziny
# klasifik�tor - rozhodovac� strom

# krab� data - data integrovan� v R
install.packages("MASS")
library(MASS)
library(rpart)
library(rpart.plot)

data(crabs)

# nastavit gener�tor n�hodn�ch c�sel 
set.seed(12345)

# vytvoren� tr�novac� mnoziny (80%), kter� bude rozdelena na 10 slozek, a testovac� mnoziny (20%)
ind <- sample(1:nrow(crabs),0.8*nrow(crabs))

trainCrabs <- crabs[ind,]
testCrabs <- crabs[-ind,]

# toto je funkce
drawLearningCurve <- function(x, y, xtest, ytest, nfolds=10) {
  
  folds <- rep_len(1:nfolds,nrow(x))
  
  acc <- vector(length=nfolds)
  
  for(j in 1:nfolds){ 
    train <- cbind(y[folds <= j],x[folds <= j,])
    names(train)[1] <- 'class'
    tree <- rpart(class ~ .,data=train,control = rpart.control(minsplit = 3))
    acc[j] = sum(predict(tree,newdata=xtest,type='class') == ytest)/length(ytest)
  }
  
  plot((1:nfolds)/nfolds,acc,type="b",col=2,xlab='Mohutnost mnoziny',ylab='Uspesnost',ylim=c(0,1))
  abline(h=0.5, col="black")
}

# an example of use
drawLearningCurve(trainCrabs[,-1],trainCrabs[,1],testCrabs[,-1],testCrabs[,1],20)

##
# 10slozkov� kr�zov� validace
##

# nacten� krab�ch dat
library(MASS)
library(rpart)
library(rpart.plot)

data(crabs)

# nastavit gener�tor n�hodn�ch c�sel 
set.seed(12345)

# vytvoren� tr�novac� mnoziny (80%), kter� bude rozdelena na 10 slozek, a testovac� mnoziny (20%)
ind <- sample(1:nrow(crabs),0.8*nrow(crabs))

trainCrabs <- crabs[ind,]
testCrabs <- crabs[-ind,]

folds <- rep_len(1:10,nrow(trainCrabs))

# overen� velikost� mnozin

# training set
dim(trainCrabs)

# folds in training set
table(folds)

# testing set
dim(testCrabs)

# hodnoty parametru maxdepth, kter� budeme optimalizovat 
parameter <- seq(from = 1, to = 10, by = 1);

# inicializace vektoru pro klasifikacn� presnosti
accValid <- matrix(NA,nrow=length(parameter),ncol=10)
accTrain <- matrix(NA,nrow=length(parameter),ncol=10)

for (i in 1:length(parameter)){
  for(j in 1:10){ 
    train <- trainCrabs[folds!=j,]
    valid <- trainCrabs[folds==j,]
    tree <- rpart(sp ~ .,data=train,control = rpart.control(minsplit=10,maxdepth=parameter[i]))
    accTrain[i,j] <- sum(predict(tree,type='class') == train$sp)/nrow(train)
    accValid[i,j] <- sum(predict(tree,newdata=valid,type='class') == valid$sp)/nrow(valid)
  }
}

avgAccTrain <- apply(accTrain,1,mean)
avgAccValid <- apply(accValid,1,mean)

# z�vislost tr�novac� (zelen�) a validacn� (cerven�) �spesnosti
plot(parameter,avgAccValid,type="b",col=2,xlab='Maximal tree depth',ylab='Accuracy',ylim=c(0.5,1))
lines(parameter,avgAccTrain,type="b",col=3)
legend('bottomright',c('Validation set','Training set'),col=c(2,3),pch='---')

# nalezen� optim�ln� hodnoty parametru z hlediska �spesnosti klasifikace
maxdepthValidated = parameter[which.max(avgAccValid)]

# odhad �spesnosti klasifikace na nez�visl�ch datech
finalTree <- rpart(sp ~ .,data=trainCrabs,control = rpart.control(minsplit=10,maxdepth=maxdepthValidated))
testAcc <- sum(predict(finalTree,newdata=testCrabs,type='class') == testCrabs$sp)/nrow(testCrabs)

# v�sledn� rozhodovac� strom
rpart.plot(finalTree)

library(MASS)
library(rpart)
library(rpart.plot)

data(crabs)

# nastavení generátoru náhodných čísel pro reprodukovatelnost
set.seed(12345)

# nahrání celých dat jako základ pro bootstrap
allData <- crabs

# parametry
parameter <- seq(from = 1, to = 10, by = 1)
numBootstraps <- 32

# inicializace matice pro průměrné přesnosti
bootAcc <- matrix(NA, nrow = length(parameter), ncol = numBootstraps)

for (i in 1:length(parameter)) {
  for (b in 1:numBootstraps) {
    # výběr s návratem pro trénovací množinu
    trainIndices <- sample(1:nrow(allData), size = nrow(allData), replace = TRUE)
    testIndices <- setdiff(1:nrow(allData), trainIndices)
    
    trainData <- allData[trainIndices,]
    testData <- allData[testIndices,]
    
    # vytvoření rozhodovacího stromu
    tree <- rpart(sp ~ ., data = trainData, control = rpart.control(minsplit = 10, maxdepth = parameter[i]))
    
    # výpočet přesnosti na testovací množině
    preds <- predict(tree, newdata = testData, type = "class")
    bootAcc[i, b] <- sum(preds == testData$sp) / nrow(testData)
  }
}

# průměrná přesnost pro každou hloubku stromu
avgBootAcc <- rowMeans(bootAcc)

# graf zobrazující závislost průměrné přesnosti na hloubce stromu
plot(parameter, avgBootAcc, type = "b", col = 2, xlab = "Maximal tree depth", ylab = "Average Accuracy", ylim = c(0.5, 1))
legend("bottomright", "Bootstrap validation accuracy", col = 2, pch = 16)

