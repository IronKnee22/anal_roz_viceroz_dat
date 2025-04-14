## Exercise 1
data <- airquality

library(ggplot2)

ggplot(airquality, aes(x = factor(Month), y = Temp, fill = factor(Month))) +
  geom_boxplot(outlier.colour = "orange", outlier.shape = 1) +
  scale_fill_manual(values = rep("orange", 5)) +  # Obarvení boxplotů
  labs(x = "Měsíc", y = "Teplota (°F)", title = "Boxploty teploty vzduchu podle měsíce") +
  theme_minimal()

aggregate(Temp ~ Month, data = airquality, median)

## Exercise 2
vec_1 <- rnorm(4000, mean = 100, sd = 30)
vec_2 <- rnorm(4000, mean = 200, sd = 30)

par(mfrow = c(1,2))
hist(vec_1)
hist(vec_2)

# Nastavení grafického okna pro jediný plot
par(mfrow = c(1, 1))

# Histogram pro první vektor
hist(vec_1, breaks = 30, col = rgb(1, 0, 0, 0.5), main = "Výška rostlin", xlab = "Výška", ylab = "Frekvence", xlim = range(c(vec_1, vec_2)), ylim = c(0, 300))
# Přidání histogramu pro druhý vektor
hist(vec_2, breaks = 50, col = rgb(0, 0, 1, 0.5), add = TRUE)

# Přidání legendy
legend("topright", legend = c("Rostlina A", "Rostlina B"), fill = c(rgb(1, 0, 0, 0.5), rgb(0, 0, 1, 0.5)))

## Exercise 3
library(ggplot2)

data_mpg = mpg
ggplot(data_mpg, aes(x = factor(class), y = hwy)) +
  geom_boxplot(color = "red", fill = "orange", alpha = 0.2) +
  labs(title = "Highway Miles per Gallon by Car Class", x = "Car Class", y = "Highway MPG")

ggplot(data_mpg, aes(x = factor(class), y = hwy, fill = class)) +
  geom_boxplot(alpha = 0.2) +
  labs(title = "Highway Miles per Gallon by Car Class", x = "Car Class", y = "Highway MPG") +
  theme(legend.position = "none")

library(RColorBrewer)

ggplot(data_mpg, aes(x = factor(class), y = hwy, fill = class)) +
  geom_boxplot(alpha = 0.2) +
  labs(title = "Highway Miles per Gallon by Car Class", x = "Car Class", y = "Highway MPG") +
  scale_fill_brewer(palette = "BuPu") +
  theme(legend.position = "none")

## Exercise 4
name = letters[1:5]
values = sample((4:15), 5)
sd = c(1, 0.2, 3, 2, 4)

data_letters = data.frame(name, values, sd)

library(ggplot2)

ggplot(data_letters, aes(x = name, y = values, fill = "skyblue")) +
  geom_bar(stat = "identity", color = "black") +  # Přidáme černý obrys pro lepší vizualitu
  labs(title = "Sloupcový graf s chybovými úsečkami", x = "Jméno", y = "Hodnota") +
  theme_minimal() +
  scale_fill_identity()

ggplot(data_letters, aes(x = name, y = values)) +
  geom_bar(stat = "identity", fill = "skyblue", color = "black") +  # Sloupcový graf
  geom_errorbar(aes(ymin = values - sd, ymax = values + sd), width = .2, color = "orange") +  # Chybové úsečky
  labs(title = "Sloupcový graf s chybovými úsečkami", x = "Jméno", y = "Hodnota") +
  theme_minimal()

## Exercise 5
data <- adult

cat("Počet atributů:", length(data))

# Kontrola chybějících hodnot
cat("Chybějící hodnoty v každém atributu:\n")
print(colSums(is.na(data)))

# Histogram pro atribut 'workclass'
ggplot(data, aes(x = workclass)) +
  geom_bar(stat = "count", fill = "steelblue") +
  theme_minimal() +
  labs(title = "Histogram of Workclass", x = "Workclass", y = "Frequency")

# Zjištění, co znamená '?' v atributu 'workclass'
cat("Hodnota '?' v atributu 'workclass' označuje jinak pracující lidi nebo to nechtěli uvádět")

# Zjištění dominantní hodnoty u atributu 'hours.per.week'
dominant_value <- as.integer(names(which.max(table(data$hours.per.week))))
cat("Dominantní hodnota atributu 'hours.per.week' je:", dominant_value, "\n")

# Zjištění počtu tříd pro klasifikaci
cat("Počet tříd pro klasifikaci:", length(unique(data$class)), "\n")







