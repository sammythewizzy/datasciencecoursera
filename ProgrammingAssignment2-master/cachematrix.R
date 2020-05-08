## Following set of functions can cache the inverse of a given matrix 

## This function creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  setmx <- function(y = matrix()) {
    x <<- y
    m <<- NULL
  }
  
  getmx <- function() {
    x
  }
  
  setInv <- function(Inv) {
    m <<- Inv
  }
  
  getInv <- function() {
    m
  }
  
  list (setmx = setmx, getmx = getmx, setInv = setInv, getInv = getInv)
  
}


## this function will be able to search the memory for the inverse of a matrix 
## and return it. If there is no inverse available in memory, it will solve a
## and return the inverse


cacheSolve <- function(x, ...) {
  m <- x$getInv()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  
  Inv <- x$getmx()
  m <- solve(Inv)
  x$setInv(m)
  m
  
}
