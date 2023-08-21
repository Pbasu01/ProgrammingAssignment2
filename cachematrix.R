## Put comments here that give an overall description of what your
## functions do

## List of functions to cache a matrix and its inverse

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y){
        x <<- y
        inv <<- NULL
    }
    get <- function() x
    setinv <- function(inver) inv <<- inver
    getinv <- function() inv
    list(set = set, get = get, setinv = setinv, getinv = getinv)
}


## Check for existing inverse then calculate it if it doesnt exist

cacheSolve <- function(x, ...) {
    inv <- x$getinv()
    if(!is.null(inv)){
        message("getting cached inverse")
        return(inv)
    }
    matrix <- x$get()
    inv <- solve(matrix)
    x$setinv(inv)
    inv
}
