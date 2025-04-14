library(MASS)
library(rpart)
library(rpart.plot)

data(crabs)

set.seed(12345)

parameter <- seq(from = 1, to = 10, by = 1)
numBootstraps <- 32
numFolds <- 10

allData <- crabs

bootAcc <- matrix(NA, nrow = length(parameter), ncol = numBootstraps)
kfoldAcc <- matrix(NA, nrow = length(parameter), ncol = numFolds)

# Křížová validace
folds <- sample(rep(1:numFolds, length.out = nrow(allData)))

for (i in 1:length(parameter)) {
  for (j in 1:numFolds) {
    trainData <- allData[folds != j,]
    testData <- allData[folds == j,]
    
    treeKFold <- rpart(sp ~ ., data = trainData, control = rpart.control(minsplit = 10, maxdepth = parameter[i]))
    predsKFold <- predict(treeKFold, newdata = testData, type = "class")
    kfoldAcc[i, j] <- sum(predsKFold == testData$sp) / nrow(testData)
  }
}

# Bootstrapping
for (i in 1:length(parameter)) {
  for (b in 1:numBootstraps) {
    trainIndices <- sample(1:nrow(allData), size = nrow(allData), replace = TRUE)
    testIndices <- setdiff(1:nrow(allData), trainIndices)
    
    trainData <- allData[trainIndices,]
    testData <- allData[testIndices,]
    
    treeBootstrap <- rpart(sp ~ ., data = trainData, control = rpart.control(minsplit = 10, maxdepth = parameter[i]))
    predsBootstrap <- predict(treeBootstrap, newdata = testData, type = "class")
    bootAcc[i, b] <- sum(predsBootstrap == testData$sp) / nrow(testData)
  }
}

avgKfoldAcc <- apply(kfoldAcc, 1, mean)
avgBootAcc <- rowMeans(bootAcc)

plot(parameter, avgKfoldAcc, type = "b", pch = 19, col = "blue", ylim = c(0.5, 1), ylab = "Accuracy", xlab = "Max Depth")
points(parameter, avgBootAcc, type = "b", pch = 17, col = "red")
legend("bottomright", legend = c("10-Fold Cross Validation", "Bootstrapping"), col = c("blue", "red"), pch = c(19, 17))

