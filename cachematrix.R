## The below functions create a special object that stores a matrix and its inverse
## matrix is stored via first function and inverse found via second function

## creates an R object that stores a matrix and its inverse

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <<- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  set_matrix_inverse <- function(solve) m <<- solve
  get_matrix_inverse <- function() m
  list(set = set, get=get,
       set_matrix_inverse = set_matrix_inverse,
       get_matrix_inverse = get_matrix_inverse)
}


## find inverse of a matrix via 
## retrieving from the cache if it is there 
## or using solve function
## sets the value of the matrix inverse in the cache

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$get_matrix_inverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$set_matrix_inverse(m)
  m
}
