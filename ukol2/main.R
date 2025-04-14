data <- ukol_a_vino

head(data)

str(data)
summary(data)

data_features <- data[, !(names(data) %in% c("Quality", "Sweet"))]

data_scaled <- scale(data_features)

library(dendextend)
library(factoextra)

dist_matrix <- dist(data_scaled, method = "euclidean")

hc <- hclust(dist_matrix, method = "ward.D2")

plot(hc, labels = FALSE, main = "Dendrogram vín", xlab = "", sub = "")

rect.hclust(hc, k = 4, border = "red")

clusters <- cutree(hc, k = 4)

data$cluster <- clusters

aggregate(data[, 1:11], by = list(Cluster = data$cluster), FUN = mean)

aggregate(quality ~ cluster, data = data, FUN = mean)





