# https://wiki.qcbs.ca/r_workshop1


#################

radius <- 5
pi*radius^2

### Illustrating the concept of object

# Let's create an object called mean_x.
# The # symbol is used in R to indicate comments. It is not processed by R.
# It is important to add comments to code so that it can be understood and used by other people.
mean_x <- (2 + 6) / 2
# Typing its name will return its value.
mean_x


#Order of priorities with assignment operator and equal sign
y <- x = 5 
#Error in y <- x = 5 : object 'y' not found
y = x <- 5 
y
#[1] 5
x
#[1] 5


# Challenge 5

euler_value <- 1 + 1.718282

# challenge 6 
# obj name can't start w a number



#Creating vectors in R

# Create a numeric vector with the c (which means combine or concatenate) function.
# We will learn about functions soon!
num_vector <- c(1, 4, 3, 98, 32, -76, -4)

# Create a character vector. Always use "" to delimit text strings!
char_vector <- c("blue", "red", "green")

# Create a logical or boolean vector. Don't use "" or R will consider this as text strings.
bool_vector <- c(TRUE, TRUE, FALSE)

#It is also possible to use abbreviations for logical vectors.
bool_vector2 <- c(T, T, F)



# Challenge 7

odd_n <- c(1, 3, 5, 7, 9)

# use dput() to reverse = the content of an object formatted as a vector

odd_n
dput(odd_n)

structure(c(1, 3, 5, 7, 9))



#Calculations with vectors
# Create two numeric vectors.
x <- 1:5

# An equivalent form is: x <- c(1:5).
y <- 6
# Remember that the : symbol, when used with numbers, is the sequence operator.
# It tells R to create a series of numbers increasing by 1.
# Equivalent to this is x <- c(1,2,3,4,5)

# Let's sum both vectors.
# 6 is added to all elements of the x vector.
x + y
# [1]  7 8 9 10 11

# Let's multiply x by itself.
x * x
#[1]  1 4 9 16 25

# It is the same thing as using exponents:
x^2
#[1]  1 4 9 16 25


#Creating a data frame
# We first start by creating vectors.
site_id <- c("A1.01", "A1.02", "B1.01", "B1.02")
soil_pH <- c(5.6, 7.3, 4.1, 6.0)
num_sp <- c(17, 23, 15, 7)
treatment <- c("Fert", "Fert", "No_fert", "No_fert")

# We then combine them to create a data frame with the data.frame function.
my_df <- data.frame(site_id, soil_pH, num_sp, treatment)

# Visualise it!
my_df


#Here the dput() function in another example.
dput(my_df)


# It's possible to rebuild the initial data frame (with some associated metadata as the class of variables) by copying and pasting the previous output:
#structure(list(site_id = structure(1:4, .Label = c("A1.01", "A1.02", "B1.01", "B1.02"), class = "factor"),
 #                soil_pH = c(5.6, 7.3, 4.1, 6),
  #               num_sp = c(17, 23, 15, 7),
   #              treatment = structure(c(1L, 1L, 2L, 2L), .Label = c("Fert", "No_fert"), class = "factor")),
    #        class = "data.frame", row.names = c(NA, -4L))


####### Indexing objects in R #######
####################################

#Indexing a vector
# Let's first create a numeric and a character vector.
# There is no need to do this again if you already did it in the previous exercise!
odd_n <- c(1, 3, 5, 7, 9)

# Extract the second element of the numeric vector.
odd_n[2]


# Extract the second and fourth elements of the numeric vector.
odd_n[c(2, 4)]

# Extract all but the two first elements of the numeric vector.
odd_n[c(-1, -2)]

# If you select a position that is not in the numeric vector
odd_n[c(1,6)]
# There is no sixth value in this vector so R returns a null value (i.e. NA)
# NA stands for 'Not available'.

# You can use logical statement to select values.
odd_n[odd_n > 4]

# Extract all elements of the character vector corresponding exactly to "blue".
char_vector[char_vector == "green"]
# Note the use of the double equal sign ==.


#Challenge 8
num_vector[4]
num_vector[c(1,4)]
num_vector[c(-2,-4)]


#Challenge 9 
char_vector <- c("blue", "green", "red")
char_vector

char_vector == "blue"
char_vector[char_vector == "blue"]


##Indexing a data frame

# Let's reuse the data frame we created earlier (my_df)
# Extract the 1st row of the data frame
my_df[1, ]

# Extract the 3rd columm
my_df[, 3]

# Extract the 2nd element of the 4th column
my_df[2, 4]

# Extract lines 2 to 4
my_df[c(2:4), ]

# Extract the "site_id" column by referring directly to its name
# The dollar sign ($) allows such an operation!
my_df$site_id

# Extract the "site_id" and "soil_pH" variables
my_df[, c("site_id","soil_pH")]




#Testing logical statements
# First, let's create two vectors for comparison.
x2 <- c(1:5)
y2 <- c(1, 2, -7, 4, 5)

# Let's verify if the elements in x2 are greater or equal to 3.
# R returns a TRUE/FALSE value for each element (in order).
x2 >= 3
#[1] FALSE FALSE TRUE TRUE TRUE

# Let's see if the elements of x2 are exactly equal to those of y2.
x2 == y2
#[1] TRUE TRUE FALSE TRUE TRUE

# Is 3 not equal to 4? Of course!
3 != 4
#[1] TRUE

# Let's see which values in x2 are greater than 2 but smaller than 5.
# You have to write x2 twice.
# If you write x2 > 2 & < 5, you will get an error message.
x2 > 2 & x2 < 5
#[1] FALSE FALSE TRUE TRUE FALSE


#Challenge 10 ###

num_sp*num_vector[1:4]
#mine worked but correct is: 
my_df$num_sp*num_vector[c(1:4)] > 25


######### FUNCTIONS ############
############

#function_name(arg1, arg2, .)

#Objects as arguments
 a <- 3
 b <- 5
 sum(a, b)
 


#challenge 11
 
a <- 1:5
b <- 2

result_add <- a + b
result_add

result_sum <- sum(a,b)
result_sum

sum(result_sum, 5)


#argument name

log(2, base = 2)

#Arguments each have a name that can be provided during a function call.
#If the name is not provided, the order of the arguments does matter.
#If the name is provided, the order of the arguments does not matter.

#To provide an argument name during a function call, just enter it in the form name=value.

#Challenge 12

a <- 1:100
b <- a^2

plot(a,b)
plot(b,a)
plot(x = a, y = b)
plot( y = b, x = a)
#Plots the graph of b as a function of a. The argument names are provided, the order of the arguments does not matter.



# As a reference, here is a list of some of the most common R functions:


#sqrt, log, exp, max, min, sum, mean, sd, var, summary, plot, par, paste, format,
#head, length, str, names, typeof, class, attributes, library, ls, rm, setwd, getwd, file.choose,
#c, seq, rep, tapply, lapply, aggregate, merge, cbind, rbind, unique,
#help (or ?), help.search (or ??), help.start



####### Packages

#need to load packages once per R sesssion

library("ggplot2")
qplot(1:10, 1:10)

#It is good practice to unload packages once we are done with them because it might conflict with other packages. Unloading a package is done with the detach() function and by specifying that it is a package:

detach(package:ggplot2)

##HELP

??sequence

#On the left, we have the name of the function and the package in which we can find it in the format package_name::function_name
#On the right, we have the description of the function

?seq

##Challenge 13
seq(from = 0, to = 10, by = 2)

fav.nums <- c(808, 10, 12, 21, 5)

fav.nums

?sort

sort(fav.nums, decreasing = TRUE)

#Challenge 14

#?sqrt   .. sqrt()
# ??mean ... mean()

#??combine .. cbind()

#??list .. ls()
