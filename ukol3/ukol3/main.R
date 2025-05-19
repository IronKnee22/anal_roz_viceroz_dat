data <- data_C_diabetes_indiani
str(data)
summary(data)
head(data)


data$test <- factor(data$test, levels = c("negatif", "positif"))
summary(data$test)
table(data$test)

set.seed(123)


index <- sample(1:nrow(data), size = 0.7 * nrow(data))
train <- data[index, ]
test <- data[-index, ]


prop.table(table(train$test))
prop.table(table(test$test))


log_model <- glm(test ~ pregnant + glucose + diastolic + triceps +
                   insulin + bmi + diabetes + age,
                 data = train,
                 family = binomial)

summary(log_model)

prob <- predict(log_model, newdata = test, type = "response")
pred <- factor(ifelse(prob > 0.5, "positif", "negatif"), levels = c("negatif", "positif"))

conf_matrix <- table(Predikce = pred, Skutečnost = test$test)
print(conf_matrix)

accuracy <- mean(pred == test$test)
cat("Přesnost logistické regrese:", round(accuracy * 100, 2), "%\n")


library(rpart)
library(rpart.plot)

tree_model <- rpart(test ~ pregnant + glucose + diastolic + triceps +
                      insulin + bmi + diabetes + age,
                    data = train,
                    method = "class")

rpart.plot(tree_model)

tree_pred <- predict(tree_model, newdata = test, type = "class")
tree_conf_matrix <- table(Predikce = tree_pred, Skutečnost = test$test)
print(tree_conf_matrix)

tree_accuracy <- mean(tree_pred == test$test)
cat("Přesnost rozhodovacího stromu:", round(tree_accuracy * 100, 2), "%\n")


library(ROSE)

balanced_train <- ROSE(test ~ ., data = train, seed = 123)$data
prop.table(table(balanced_train$test))


tree_bal <- rpart(test ~ ., data = balanced_train, method = "class")
pred_bal <- predict(tree_bal, newdata = test, type = "class")

conf_matrix_bal <- table(Predikce = pred_bal, Skutečnost = test$test)
print(conf_matrix_bal)

acc_bal <- mean(pred_bal == test$test)
cat("Přesnost po vyvážení (strom):", round(acc_bal * 100, 2), "%\n")


log_model_bal <- glm(test ~ pregnant + glucose + diastolic + triceps +
                       insulin + bmi + diabetes + age,
                     data = balanced_train,
                     family = binomial)

prob_bal <- predict(log_model_bal, newdata = test, type = "response")
pred_log_bal <- factor(ifelse(prob_bal > 0.5, "positif", "negatif"), levels = c("negatif", "positif"))

conf_matrix_log_bal <- table(Predikce = pred_log_bal, Skutečnost = test$test)
print(conf_matrix_log_bal)

acc_log_bal <- mean(pred_log_bal == test$test)
cat("Přesnost logistické regrese po vyvážení:", round(acc_log_bal * 100, 2), "%\n")

log_results <- numeric(100)

for (i in 1:100) {
  idx <- sample(1:nrow(data), size = 0.7 * nrow(data))
  train <- data[idx, ]
  test <- data[-idx, ]
  
  model <- glm(test ~ ., data = train, family = binomial)
  pred <- factor(ifelse(predict(model, newdata = test, type = "response") > 0.5, 
                        "positif", "negatif"), levels = c("negatif", "positif"))
  
  log_results[i] <- mean(pred == test$test)
}

cat("Logistická regrese (nevyvážená)\n")
cat("Min:", round(min(log_results) * 100, 2), "%\n")
cat("Max:", round(max(log_results) * 100, 2), "%\n")
cat("Průměr:", round(mean(log_results) * 100, 2), "%\n")

log_bal_results <- numeric(100)

for (i in 1:100) {
  idx <- sample(1:nrow(balanced_train), size = 0.7 * nrow(balanced_train))
  train <- balanced_train[idx, ]
  test <- balanced_train[-idx, ]
  
  model <- glm(test ~ ., data = train, family = binomial)
  pred <- factor(ifelse(predict(model, newdata = test, type = "response") > 0.5, 
                        "positif", "negatif"), levels = c("negatif", "positif"))
  
  log_bal_results[i] <- mean(pred == test$test)
}

cat("Logistická regrese (vyvážená)\n")
cat("Min:", round(min(log_bal_results) * 100, 2), "%\n")
cat("Max:", round(max(log_bal_results) * 100, 2), "%\n")
cat("Průměr:", round(mean(log_bal_results) * 100, 2), "%\n")

tree_bal_results <- numeric(100)

for (i in 1:100) {
  idx <- sample(1:nrow(balanced_train), size = 0.7 * nrow(balanced_train))
  train <- balanced_train[idx, ]
  test <- balanced_train[-idx, ]
  
  model <- rpart(test ~ ., data = train, method = "class")
  pred <- predict(model, newdata = test, type = "class")
  
  tree_bal_results[i] <- mean(pred == test$test)
}

cat("Rozhodovací strom (vyvážená)\n")
cat("Min:", round(min(tree_bal_results) * 100, 2), "%\n")
cat("Max:", round(max(tree_bal_results) * 100, 2), "%\n")
cat("Průměr:", round(mean(tree_bal_results) * 100, 2), "%\n")

