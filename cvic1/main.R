## Exercise 1
p_hat <- 850/1000

alpha <- 0.1
z <- qnorm(1-alpha /2)
margin_of_error <- z * sqrt(p_hat * (1-p_hat)/1000)
lower_bound <- p_hat - margin_of_error
upper_bound <- p_hat + margin_of_error

p_hat
lower_bound
upper_bound

## Exercise 2
drug_A <- c(132, 136, 120, 139, 138, 145, 150, 135, 131, 122, 120, 129, 127, 117, 129)
drug_B <- c(137, 135, 154, 135, 147, 119, 137, 129, 150, 140, 135, 145, 124)
result_drug <- t.test(drug_A, drug_B, var.equal = FALSE, alternative = "two.sided", conf.level = 0.95)
print(result_drug)

## Exercise 3
high_protein <- c(134, 146, 104, 119, 124, 161, 107, 83, 113, 129, 97, 123) 
low_protein <- c(70, 118, 101, 85, 107, 132, 94)
result_protein <- t.test(low_protein, high_protein, var.equal = FALSE, alternative = "l", conf.level = 0.95)
print(result_protein)
