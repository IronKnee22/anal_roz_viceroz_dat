## Exercise 1
teens <- snsdata
summary(teens)

teens$missing_gender <- ifelse(is.na(teens$gender), 1, 0)
table(teens$gender)
# Podíváme se, kolik máme chybějících dat u pohlaví
table(teens$missing_gender)

teens$age <- ifelse(teens$age < 13 | teens$age > 19, NA, teens$age)
summary(teens$age)

teens$mean_age <- ave(teens$age, teens$gradyear, FUN=function(x) mean(x, na.rm=TRUE))

teens$age <- ifelse(is.na(teens$age), teens$mean_age, teens$age)
summary(teens$age)

set.seed(2345)
norm_data <- scale(teens[, 5:40]) # Normalizace příznaků
kmeans_result <- kmeans(norm_data, centers=5)

# Velikosti a středy shluků
print(kmeans_result$size)
print(kmeans_result$centers)

teens$cluster <- kmeans_result$cluster

# Průměrný věk, rozložení pohlaví a počet přátel
aggregate(cbind(age, friends) ~ cluster, data=teens, FUN=mean)
aggregate(gender ~ cluster, data=teens, FUN=function(x) table(x)/length(x))

library(ggplot2)

# PCA redukce na 2 rozměry
pca <- prcomp(norm_data)
pca_df <- data.frame(PC1 = pca$x[,1], PC2 = pca$x[,2], cluster = factor(teens$cluster))

# Vykreslení pomocí ggplot2
ggplot(pca_df, aes(x = PC1, y = PC2, color = cluster)) +
  geom_point(alpha = 0.6) +
  labs(title = "2D PCA Vizualizace shluků", x = "Hlavní komponenta 1", y = "Hlavní komponenta 2") +
  theme_minimal()

