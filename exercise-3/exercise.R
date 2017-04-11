# Exercise 4: Working with Data Frames

# Load R's "USPersonalExpenditure" dataest using the `data()` function


# The variable USPersonalExpenditure is now accessible to you. Unfortunately, it's not a data.frame
# Test this using the is.data.frame function
is.data.frame(USPersonalExpenditure)

# Luckily, you can simply pass the USPersonalExpenditure variable to the data.frame function
# to convert it a data.farme
data.frame(USPersonalExpenditure)
# Create a new variable by passing the USPersonalExpenditure to the data.frame function
information <- data.frame(USPersonalExpenditure)

# What are the column names of your dataframe?
colnames(information)
# "X1940" "X1945" "X1950" "X1955" "X1960"

# Why are they so strange?
# They have x's in front of the years

# What are the row names of your dataframe?
rownames(information)
# [1] "Food and Tobacco"    "Household Operation" "Medical and Health"  "Personal Care"       "Private Education"  

# Create a column `category` that is equal to your rownames
information$category <- rownames(information)

# How much money was spent on personal care in 1940?
personal.care.1940 <- information['Personal Care', 'X1940']

# How much money was spent on Food and Tobacco in 1960
food.tobacco.1960 <- information['Food and Tobacco', 'X1960']

# What was the highest expenditure category in 1960?
highest.expenditure.1960 <- information$category[information$X1960 == max(information$X1960)]

### Bonus ###

# Write a function that takes in a year as a parameter, and 
# returns the highest spending category of that year
FindHighest <- function(year) {
  return(information$category[information[year] == max(information[year])])
}
# Using your function, determine the highest spending category of each year
highest.spending.1940 <- FindHighest('X1940')
highest.spending.1945 <- FindHighest('X1945')
highest.spending.1950 <- FindHighest('X1950')
highest.spending.1955 <- FindHighest('X1955')
highest.spending.1960 <- FindHighest('X1960')

# Write a loop to cycle through the years, and store the highest spending category of
# each year in a list
highest <- list()
for(year in seq(1940, 1960, 5)) {
  year.index <- paste0('X', year)
  highest[year.index] <- FindHighest(year.index)
}
