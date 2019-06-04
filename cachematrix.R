## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## Creating the special matrix object that can cache its inverse
makeCacheMatrix <- function(a = matrix()) {
  ## Initializing the inverse property
  inv <- NULL
  ## Setting the matrix
  set <- function(b) {
    a <<- b
    inv <<- NULL
  }
  ## Getting the matrix
  get <- function() {
    x
  }
  setInverse <- function(inverse) {
    inv <<- inverse
  }
 
  getInverse <- function() {
    inv
  }
  ## Return a list of the methods
  list(set = set,  get = get,
       setInverse = setInverse,
       getInverse = getInverse)
  
}


## Write a short comment describing this function

cacheSolve <- function(a, ...) {
  ## Return a matrix that is the inverse of 'x'
  inv <- a$getInverse()
  ## Returning the inverse if its already set
  if (!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  ## Getting the matrix from our object
  mat <- a$get()
  inv <- solve(mat, ...)
  ## Setting the inverse to the object
  a$setInverse(inv)
  inv 
}


## Testing

testMatrix <- matrix(1:8,3,3)
cacheMatrix <- makeCacheMatrix(testMatrix)

cacheSolve(cacheMatrix)
cacheSolve(cacheMatrix)