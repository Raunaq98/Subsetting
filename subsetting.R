#####################################################################   Subsetting

########################## subsetting vectors
x <- c("a","b","c","d")    #creating a vector
print(x)

x[1]    # single bracket operator using numeric index ie. 1

x[1:4]    # single bracket operator using numeric index ie. 1 to 4

x[c(1,2)]  # when we want 1st and 2nd elements

x[c(-1,-2)]  #when we want everything except the first and second elements

x[ x > "a"]   # single bracket operator using logical indexing ( using alphabetic order logic )

logical_vector <- ( x > "a")    # creating your own logical vector
print(logical_vector)

x[logical_vector]   # using the previously defined logical vector to subset x




######################### subsetting lists
list1 <- list( foo = 1:4, bar =0.6, boo = 10) #       created simple list
print(list1)

list1[1]    # returned the entire list ie. foo 1 2 3 4

list1[[1]]    # returned only the elements of the list ie. 1 2 3 4 

list1$foo   # returns elements associated with the name "foo" ie. 1 2 3 4


list1["foo"]    # returns the list associated with the name "foo" ie. foo 1 2 3 4

list1[["foo"]]    # returns the elements associated with the name "foo" ie. 1 2 3 4

## extracting multiple elements from a list

list1[c(1,3)]   # returns the first and third lists entirely

## sometimes the index of a list is formed after computation and you cannot enter it prematurely

name <- "foo"
list1[[name]]   # returns the elements asssociated with foo ie. 1 2 3 4 

list1$name    # gives error

## nested list elements

list2 <- list(a=list(10,11,12),b=c(13,14,15))  # created a nested list
print(list2)

# the nested list is of the form :
# $a
# $a[[1]]
# [1] 10
#
# $a[[2]]
# [1] 11
#
# $a[[3]]
# [1] 12
#
#
# $b
# [1] 13 14 15]

#we need to extract the element "12" ie. the 3rd element of the 1st element of original list

list2[[1]][[3]]

# OR

list2[[c(1,3)]]




########################### subsetting matrices

matrix1 <- matrix(1:6, nrow=2, ncol=3)    #created simple matrix
row.names(matrix1) <- c("hi","bye")
colnames(matrix1) <- c("what","why","who")
print(matrix1)

# now we want the element "6" ie. 2nd row and 3rd column 

matrix1[2,3]

# we want the entire first row

matrix1[1,]

#we want the entire 2nd column

matrix1[,2]

#the problem with this is that the element that has been returned is now a vector ie. [1] and not a matrix[ , ]
# fix by drop=FALSE

matrix1[2,3]
# this returns [1] 6

matrix1[2,3,drop=FALSE]
#this returns   
#      who
# bye  6
#hence, this is a 1x1 matrix




######################### Partial Matching


list3<- list(aabey=c(1,2,3,4),bella=c(5,6,7,8))
print(list3)

# we now want to extract the elements associated with aabey, we can do this by:

list3[["aabey"]]

# or we can just

list3$a    # R matches "a" with the name which matches partially with another name (in case of $)

# for usage with double brackets we set exact flag = FALSE so that it doesnt search for exact match

list3[["a",exact=FALSE]]





########################## Removing NA Values

faulty_data <- c(1,2,NA,5,6,NA,9)  # created a vector that has NAs
print(faulty_data)

fault <- is.na(faulty_data)   #created vector "fault" that contains fault flags for previous vector
print(fault)

corrected_data <- faulty_data[!fault]
print(corrected_data) #printed original vector without the faults

temporary1<- c( -1, -5,0,NA, 7,NA,-3,NA,9)
# we want the data that is positive as well as free of NA

temporary1[ !is.na(temporary1) & temporary1 > 0]


##### when you want to take the subset of two vectors without NAs

temp1 <- c(1,2,3,NA,5,NA,7,8,9,10)
temp2 <- c(11,NA,NA,14,NA,16,NA,NA,NA,20)
print(temp1)
print(temp2)

good<- complete.cases(temp1,temp2)     # this functions gives positions at which both vectors are present
print(good)

#   [1]  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE TRUE

temp1[good]    #gives elements of temp1 that have some corresponding element in temp2

temp2[good]    #gives elements of temp2 that have some corresponding element in temp1



#### removing NAs from data fraames

# using a pre loaded data set "airquality"

airquality[1:6,]

#     Ozone Solar.R  Wind Temp Month Day
#  1    41     190   7.4   67     5   1
#  2    36     118   8.0   72     5   2
#  3    12     149  12.6   74     5   3
#  4    18     313  11.5   62     5   4
#  5    NA      NA  14.3   56     5   5
#  6    28      NA  14.9   66     5   6

correct<-complete.cases(airquality)
airquality[correct,][1:6,]
#look at nested list subsetting to understand
# basically it wants rows that are good AND the rows 1:6

#  Ozone Solar.R Wind Temp Month Day
#  1    41       190  7.4   67     5   1
#  2    36       118  8.0   72     5   2
#  3    12       149 12.6   74     5   3
#  4    18       313 11.5   62     5   4
#  7    23       299  8.6   65     5   7
#  8    19        99 13.8   59     5   8



