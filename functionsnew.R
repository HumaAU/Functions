# Trying to commit changes!
# Trying to commit changes!
# Trying to commit changes!
# Trying to commit changes!

#DS 413/613
# Functions  Chapters 15 and 17
 install.packages("tidyverse")
 library(tidyverse)
 install.packages("dplyr")
 library(dplyr)
 
# A function is a structured and sequenced set of commands 
# that process input values to produce output values efficiently.
# A function reduces repetitive calculations that often result 
# in mistakes, errors, and unneeded work.

# Consider the task of calculating the volume of twenty 
# cylinders with the given dimensions:
# Cylinder1  r = 4, h = 6      V = pi(4^2)(6)
# Cylinder2  r = 3, h = 10     V = pi(3^2)(10)
# Cylinder3  r = 2.5, h = 5    V = pi((2.5)^2)(5)
# Cylinder4  r = 12, h = 4     V = pi(12^2)(4)
# Cylinder5  r = 20, h = 14    V = pi(20^2)(16)
#            .
#            .
#            .
# Cylinder20 r = 12.25, h = 9  V = pi(12.25)(9)

# The formula V = pi(r^2)h would have to be applied correctly 
# 20 times, if you are to do these manually; one at a time.  
# There is certainly a high risk for errors i.e. data entry 
# or misuse of the formula for a problem.
 
# Were any errors committed in the executions above ?
 
# We now use a function for this problem to reduce repetitive
# calculations and possible errors
 
# Basic function structure:
 
# function_name <- function (argument/input variables) {
# statements/expression for calculation/equation          
#  }

# Call the function and evaluate


# Example 1 Write a function to find the volume of a cylinder

#  Volume = pi(r^2)h,  pi is approximately 3.14

volume_cylinder <- function(r, h) {
 pi*r^2*h
}

volume_cylinder(4, 6)
volume_cylinder(3, 10)

# Now lets add a descriptive statement for the output

# Example 2
volume_cylinder <- function(r, h) {
  V = pi*r^2*h
  print(paste("The volume of a cylinder with a radius of 4 and a height of 6 is",V))
}

volume_cylinder(4, 6)

# Now lets produce an answer that is rounded to a specified value

# Example 3
volume_cylinder <- function(r, h) {
  V = pi*r^2*h
  print(paste("The volume of a cylinder with a radius of 4 and 
              a height of 6 is", 
              round(V, digits = 3))) #use the round function inside the print paste function
  
}

volume_cylinder(4, 6)


# Example 4

# function to print x raised to the power y
pow <- function(x, y) {
  result <- x^y
  print(paste(x,"raised to the power", y, "is", result))
}

pow(8, 2)
pow(2,8)
pow(x = 2, y = 8)
pow(y = 8, x = 2)
pow(x=8, 2)
pow(2, x = 8)
pow(y = 8, 2)
pow(2, y = 8)

pow <- function(x, y = 2) {
  # function to print x raised to the power y
  result <- x^y
  print(paste(x,"raised to the power", y, "is", result))
}

pow(5)

pow(5,3)  # overrides the default assignment


# Example 5a

# Write a function that will create the first 10 squares of
# positive odd integers. That is your function will give you 
# the following output. 1, 9, 25, 49, ., 361 when you input 
# values 1 to 10.

# How do you write a positive odd integer?  2*x - 1 ,  where x 
# is positive integer


# Method 1

C <- function(x) {
  (2*x - 1)^2
}

C(1:10)

#5**2 is the same as writing 5^2 (just FYI)

# Method 2
C <- function(x) {
  (2*x - 1)^2
  return((2*x - 1)^2) ##We can use the embedded call return() which is just a matter of style
} 

C(1:10)


# Example 5b

# Create a data frame
data_frame <- tibble(    #tibble construction displays the first 10 rows
  c1 = rnorm(50, 5, 1.5),  #each column with 50 values, mean of 5 and sd of 1.5
  c2 = rnorm(50, 5, 1.5),    
  c3 = rnorm(50, 5, 1.5),    
)
data_frame

# check
mean(data_frame$c1)
sd(data_frame$c1)

# Let's normalize over a column. The following would have to be 
# done for each column, lets use column 1.


(data_frame$c1 - min(data_frame$c1)) / 
(max(data_frame$c1) - min(data_frame$c1))

# (The minimum value of c1 subtracted from each value of c1
# divided by the maximum value of c1 minus the minimum value
# of c1)

# This is a tedious task, for we would need similar calculations
# for every element of all three columns

mean(data_frame$c1)
min(data_frame$c1)
max(data_frame$c1)
data_frame$c1


# We shall construct a function that will reduce the repetitive 
# steps required.


(data_frame$c1 - min(data_frame$c1)) / 
(max(data_frame$c1) - min(data_frame$c1))

# Assign expression to a variable for easier recognition and 
# coding
data_frame$c1 -> x
x

normalize <- function(x){
  # step 1: create the numerator
  numerator <- x-min(x)
  # step 2: create the denominator
  denominator <- max(x)-min(x)
  # step 3: divide nominator by denominator
  normalize <- numerator/denominator
  # return the value
  return(normalize)
}
normalize(x)

# Using our function how could we get results for C2 ?
data_frame$c2->y
normalize(y)


#write a function to find the area and the perimeter of a square

ap <- function(h) {
  area = h**2    #we dont need to use comma after one equation
  perimeter = h*4
  print(paste("The area of the square is", area, " and the perimeter is", perimeter))
}

ap <- function(h) {
  area = h**2    #we dont need to use comma after one equation
  perimeter = h*4
  return(c(area=area, perimiter=perimeter)) # we use the equals sign to add headings, without the sign the output will not have headings
}
ap(8)

# The If else statement

#if (condition) {
#  Expr1  (execute expression or command 1)
#} else {
#  Expr2  (execute expression or command 2)
#}


# Example 6

# Set the if-else statement
quantity <- 13  # indicate a quantity to process
if (quantity > 20) {
  print('You sold a lot!')
} else {
  print('Not enough for today')  
}

# Example 7  (Let's write a function that will test for 
# divisibility)

# Is 125 divisible by 3?

# Method 1 
x<-125
if (x %% 3 == 0) {  #its divisible by 3 if the remainder is 0
  print("the number is divisible by 3")
} else {
  print("the number is not divisible by 3")
}


# Method 2 #we use the above method to create a function, 
#so we can test multiple values, not just 125
# we create a function using if else statement
FunctionA <- function(x)  
  if (x %% 3 == 0) {
    print("the number is divisible by 3")
  } else {
    print("the number is not divisible by 3")
  }
  
FunctionA(125)

FunctionA(2112)

# Multiple Conditions  / else if

# if
# else if
# else

# Example 8
# Write a function that will give a result for three conditions: 
# x > 0, x < 0, and x = 0.

check <- function(x) {
  if (x > 0) {
    result <- "Positive"
  }
  else if (x < 0) {
    result <- "Negative"
  }
  else {
    result <- "Zero"
  }
  return(result)
}

check(-3)
check(32)
check(0)


# Example 9

# Create vector quantity
quantity <-  26
# Create multiple condition statement
if (quantity <20) {
  print('Not enough for today')
} else if (quantity > 20  & quantity <= 30) {
  print('Average day')
} else {
  print('What a great day!')
}



# Using for loops

#For (i in vector) {
#   Exp	
#   }

# Example 1  (Write a for loop that will cube each integer
#             from 1 to 4 inclusive)

for ( i in 1:4) {
  print (i^3)
  }
  
# we can create a loop for the cube question we did earlier 
for ( i in 1:10){
  print((2*i - 1)^2)
}
#using functions
C <- function(x) {
  (2*x - 1)^2
}

C(1:10)

# Example 2  values are not consecutively ordered
# Write a for loop that will cube the following values
# -2,4,7,-1

for (i in c(-2,4,7,-1)) {
  print (i^3)
}

# Example 3  

# Changing Kilometers to miles using a for loop
# Write a for loop that will convert km measurements
# of 12,20,45,80,and 110 to miles

for (km in c(12,20,45,80,110)) {
  print(c(km, .621371*km)) # we can use concatenate inside print to display numeric values
}
  
# Example 10 Using a function to extract items from a list.

multi_return <- function() {
  my_list <- list("color" = "red", "size" = 20, "shape" = "round")
  return(my_list) 
}

a <- multi_return()
 a$color
 
a<- multi_return()
 a$shape

 a<- multi_return()
 a$size
 

# Consider the following tibble. Use two methods to find 
# the median of each column.
 

 df <- tibble(
   a = rnorm(50),
   b = rnorm(50),
   c = rnorm(50),
   d = rnorm(50)
 )
 df
 
 
 # method 1  
 
 median(df$a)
 median(df$b)
 median(df$c)
 median(df$d)
 
 
median(df[[1]]) #this will show the median of the first column

 
# method 2  The "Special For Loop Method"
 
 output <- vector("double", ncol(df))  # 1. output -this only creates a vector with 4 columns and a row of 0 0 0 0
 for (i in seq_along(df)) {            # 2. sequence
   output[[i]] <- median(df[[i]])}      # 3. body #i is the arbitrary element
  ##double square brackets is used to locate an element in a structure

 output
 
?vector
?seq_along
 
#  More examples of the "Special For Loop Method"
 mtcars 
 
 
 output2 <- vector("double", ncol(mtcars))   # 1. output
 for (i in seq_along(mtcars)) {              # 2. sequence
   output2[[i]] <- mean(mtcars[[i]])         # 3. body
 }
 output2
 
 
 
 
 
 diamonds
 
 output3 <- vector("double", ncol(diamonds))  # 1. output
 for (i in seq_along(diamonds)) {            # 2. sequence
   output3[[i]] <- mean(diamonds[[i]])      # 3. body
 }
 output3
 
 
  
  
  
