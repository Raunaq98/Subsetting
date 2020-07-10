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



####################### 

temp0 <- data.frame("var1"=sample(1:5),"var2"=sample(6:10),"var3"=sample(11:15))
#   var1 var2 var3
# 1    4    6   12
# 2    3   10   11
# 3    5    9   13
# 4    2    7   14
# 5    1    8   15

temp0<- temp0[sample(1:5),]; temp0$var2[c(1,3)]=NA
#   var1 var2 var3
# 4    2   NA   14
# 2    3   10   11
# 5    1   NA   15
# 1    4    6   12
# 3    5    9   13

temp0[1:2,"var2"]
# [1] NA 10

temp0[ (temp0$var1 <= 3 & temp0$var3 >11) ,]
#   var1 var2 var3
# 4    2   NA   14
# 5    1   NA   15

temp0[ (temp0$var1 <= 3 | temp0$var3 >15) ,]
#     var1 var2 var3
# 4    2   NA   14
# 2    3   10   11
# 5    1   NA   15

temp0[temp0$var2>8,]
#      var1 var2 var3
# NA     NA   NA   NA
# 2       3   10   11
# NA.1   NA   NA   NA
# 3       5    9   13

# this can be fixed by :

temp0[which(temp0$var2>8),]   # "which" returns the indices at which var2 is actually greater than 8 and there are no NAs
#   var1 var2 var3
# 2    3   10   11
# 3    5    9   13

sort(temp0$var1)   #increasing order
# [1] 1 2 3 4 5

sort(temp0$var1, decreasing = TRUE)
# [1] 5 4 3 2 1

sort(temp0$var2, na.last = TRUE)
#[1]  6  9 10 NA NA

sort(temp0$var2)
# [1]  6  9 10

#sorting temp0 by the values of var1

temp_var1_sort <- temp0[order(temp0$var1),]
#   var1 var2 var3
#5    1   NA   15
#4    2   NA   14
#2    3   10   11
#1    4    6   12
#3    5    9   13

temp_var1var3_sort <- temp0[order(temp0$var1,temp0$var3),]
# had there been multiple values of var 3 for a single var1,
# temp0 wouldve first been sorted according to var1
# and thenvar3 wouldve been used to further sort

temp0$var4 <- c(11,22,33,44,55)
temp0
#    var1 var2 var3 var4
# 4    2   NA   14   11
# 2    3   10   11   22
# 5    1   NA   15   33
# 1    4    6   12   44
# 3    5    9   13   55