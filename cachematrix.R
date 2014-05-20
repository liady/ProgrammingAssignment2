## This file contains 2 functions for calculating an inverse of matrix
## and storing it in cache. This is achieved by creating a CacheMatrix,
## which has an internal cache and exposes an API for handling it


## Creates a CacheMatrix object from the matrix x
## Returns a list of functions:
##      get, set - handle the underlying matrix
##      getinverse - get inverse from cache, if exists
##      setinverse - cache the inverse result

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    get <- function() x
    setinverse <- function(newinv) inv <<- newinv
    getinverse <- function() inv
    
    # return CacheMatrix API
    list(set = set, 
         get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## Inverses the given CacheMatrix x
## Tries to retrieve the result from the cache,
##  if it does not exist - calculates it and store it in the cache
## Additional arguments will be supplied to the underlying "solve" function

cacheSolve <- function(x, ...) {
    
    inv <- x$getinverse()
    
    # return result from cache, if found
    if(!is.null(inv)) {
        message("Getting result from cache")
        return(inv)
    }
    
    # calculate and insert result into cache
    data <- x$get()
    inv <- solve(data, ...)
    x$setinverse(inv)
    inv
}
