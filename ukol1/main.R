# Načtení knihoven
library(readr)
library(ggplot2)
library(dplyr)
library(corrplot)

# Načtení dat
ukol_A_vino <- read_csv("D:/Skola/semester8/anal_roz_viceroz_dat/ukol1/ukol_A_vino.csv")

# Dimenze dat
dim(ukol_A_vino)

# Kontrola chybějících hodnot
colSums(is.na(ukol_A_vino))

# Ukázka odlehlých hodnot – vybrané proměnné
par(mfrow = c(2, 3))  # Rozložení více boxplotů vedle sebe
boxplot(ukol_A_vino$`free sulfur dioxide`, main = "Free SO2", col = "lightgreen")
boxplot(ukol_A_vino$`total sulfur dioxide`, main = "Total SO2", col = "darkorange")
boxplot(ukol_A_vino$alcohol, main = "Alcohol", col = "lightblue")
boxplot(ukol_A_vino$sulphates, main = "Sulphates", col = "lightcoral")
boxplot(ukol_A_vino$density, main = "Density", col = "plum")
boxplot(ukol_A_vino$quality, main = "Quality", col = "tan")
par(mfrow = c(1, 1))  # Reset

# Transformace proměnných s pravostranným rozdělením
ukol_A_vino$log_chlorides <- log(ukol_A_vino$chlorides + 1)
ukol_A_vino$log_volatile_acidity <- log(ukol_A_vino$`volatile acidity` + 1)
ukol_A_vino$log_citric_acid <- log(ukol_A_vino$`citric acid` + 1)

# Histogram pro jednu z transformovaných proměnných
hist(ukol_A_vino$log_chlorides, main = "Histogram log(chlorides)", col = "lightblue")

# Rozložení cílové proměnné
ggplot(ukol_A_vino, aes(x = quality)) +
  geom_bar(fill = "lightblue") +
  theme_minimal() +
  labs(title = "Rozložení hodnocení kvality vína", x = "Kvalita", y = "Počet vzorků")



# Korelační matice – odstraníme netransformované verze vybraných proměnných
numeric_data <- ukol_A_vino %>%
  select(-chlorides, -`volatile acidity`, -`citric acid`, -sweet) %>%
  select(where(is.numeric))

cor_matrix <- cor(numeric_data)

# Vizualizace korelační matice
corrplot(cor_matrix, method = "color", type = "upper", tl.cex = 0.8,
         title = "Korelační matice", mar = c(0, 0, 1, 0))

# Korelace top 10 proměnných (podle síly korelace)
cor_long <- as.data.frame(as.table(cor_matrix))
cor_long <- cor_long[cor_long$Var1 != cor_long$Var2, ]
cor_long <- cor_long[!duplicated(t(apply(cor_long[,1:2], 1, sort))), ]
cor_long <- cor_long %>%
  mutate(Skupina = cut(abs(Freq),
                       breaks = c(0, 0.1, 0.3, 0.5, 0.7, 1),
                       labels = c("žádná", "slabá", "střední", "silná", "velmi silná"))) %>%
  arrange(desc(abs(Freq)))
head(cor_long, 10)

# Ukázkový scatterplot: alcohol vs density
ggplot(ukol_A_vino, aes(x = alcohol, y = density)) +
  geom_point(alpha = 0.4, color = "darkblue") +
  theme_minimal() +
  labs(title = "Závislost hustoty na obsahu alkoholu",
       x = "Alkohol (% obj.)", y = "Hustota (g/cm³)")


