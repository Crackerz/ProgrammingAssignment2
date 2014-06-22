## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## this sets up the cache variable. 

# this sets up the cache variable
# a variable needs it to be assigned to it, so the 4 functions/ their outputs can be assigned to it
makeCacheMatrix <- function(x = matrix()) {  
  m<-NULL
  set<-function(y){    #assigns the set function to the makeCacheMatrix function,
    x<<-y              # the funtion assigns the value y to the greater function above
    m<<-NULL           # and resets m to null
  }
  get<-function() x  #when this function is called, the matrix x is returned
  setmatrix<-function(solve) m<<- solve   #when setmatrix is called, the value solve is assigned to m
  getmatrix<-function() m      #and the function getmatrix returns m
  list(set=set, get=get,
       setmatrix=setmatrix,
       getmatrix=getmatrix)
}

# assigns the getmatrix value of the variable to a variable, if it has been assigned before, call it, otherwise
# calculate it again and set it to the cache.  
cacheSolve <- function(x=matrix(), ...) {
  m<-x$getmatrix()    #assigns the getmatrix function of x to m
  if(!is.null(m)){    # if there is a value in m, ie, if the line above does something then
    message("getting cached data")
    return(m)        # returns the matrix and exit function
  }               
  matrix<-x$get()   # assigns the get funtion to matrix, (which really just returns matrix x)
  m<-solve(matrix, ...) # solves the variable matrix, which is the data matix x
  x$setmatrix(m)       #assigns the solution to the setmatrix function
  m
}