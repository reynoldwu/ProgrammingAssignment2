#makeCacheMatrix is a funciton to return a list of functions
#It will store a matrix and cached value of the invverse of a matrix. 

makeCacheMatrix <- function(x = matrix()) {

m <- NULL
set <- function(y) {
	x <<- y 
	m <<- NULL
	}

get <- function() x
setInverse <- function(solve) m <<- solve
getInverse <- function() m 

list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}


#This function check the inverse of the special matrix created by makeCacheMatrix and calculate the inverse if the inverse value in special Matrix is NULL

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
	inverse <- x$getInverse()
	if(!is.null(inverse)){
		message("getting cached data")
		return(inverse)
		}
	data <- x$get()
	inverse <- solve(data)
	x$setInverse(inverse)
	inverse
}
