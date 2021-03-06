## COURSERA R PROGRAMMING, AUGUST 2014
##
## Assignment: Caching the Inverse of a Matrix
## Matrix inversion is usually a costly computation and their may be some 
## benefit to caching the inverse of a matrix rather than compute it repeatedly
## (there are also alternatives to matrix inversion that we will not discuss
## here). Your assignment is to write a pair of functions that cache the inverse
## of a matrix.
##
## Write the following functions:
##    
## 1.makeCacheMatrix: This function creates a special "matrix" object that can 
##   cache its inverse.
## 2. cacheSolve: This function computes the inverse of the special "matrix"
##    returned by makeCacheMatrix above. If the inverse has already been 
##    calculated (and the matrix has not changed), then the cachesolve should 
##    retrieve the inverse from the cache.
##
## Computing the inverse of a square matrix can be done with the solve function
## in R. For example, if X is a square invertible matrix, then solve(X) returns its inverse.
##
## For this assignment, assume that the matrix supplied is always invertible.
## 
## Put comments here that give an overall description of what your
## functions do
##
## Write a short comment describing this function
makeCacheMatrix <- function(x = matrix()) {
    # Creates a special "matrix" object that can cache its inverse.
    #
    # Argumentss:
    # x: The matrix which needs to be calculated inversed
    #
    # Returns:
    # The object that can cache the inverse of the matrix.
    inverse.x <- NULL # hold the inverse of a matrix
    set <- function(y) {
        # set the value of the matrix and clear the value of inverse matrix
        # The "<<-" operator used to set variable that already exists
        # in the parent environment.
        x <<- y
        inverse.x <<- NULL
    }
    get <- function() x # Get the value of the matrix.
    setinverse <- function(inv) {
        # Set the value of the inverse matrix.
        inverse.x <<- inv
    }
    getinverse <- function() inverse.x # Get the value of the inverse matrix.
    # create the list to access properties with $ sign.
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}
cacheSolve <- function(x, ...) {
    # Calculates matrix inverse for makeCacheMatrix object.
    #
    # Arguments:
    # x: The makeCacheMatrix object.
    #
    # Returns:
    # The inverse matrix.
    #
    inverse.x <- x$getinverse() # Get the cached value of inverse matrix.
    if(!is.null(inverse.x)) { # if cached value exists then return it.
        message("getting cached data") # notify user
        return(inverse.x) # return inverse matrix
    }
    # Cached value of inverse matrix is not exists. We will caclulate it
    data <- x$get() # Get the matrix to inverse
    inverse.x <- solve(data, ...) # Inverse matrix
    x$setinverse(inverse.x) # Store the result in the makeCacheMatrix object
    inverse.x # return inverse matrix
}
