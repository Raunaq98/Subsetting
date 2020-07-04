#####################################################################   Subsetting

########################## subsetting vectors
x <- c("a","b","c","d")    #creating a vector
print(x)

x[1]    # single bracket operator using numeric index ie. 1

x[1:4]    # single bracket operator using numeric index ie. 1 to 4

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
