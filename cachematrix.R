makeCacheMatrix <- function( x = matrix() ) {  ## Creates a special matrix object that the CacheSolve function can inverse
m <- NULL                                      ## Initialize the inverse property
set <- function( matrix ) {                    ## Sets the matrix
x <<- matrix                                      
m <<- NULL                                     
}
get <- function() {                            ## Gets the matrix 
x                                              ## Returns matrix
}
setinverse <- function(inverse) {              ## Sets inverse of the matrix
m <<- inverse
}
getinverse <- function() {                     ## Gets inverse of the matrix              
m                                              ## Returns inverse 
}
list(set = set, get = get,                     ## Returns a method list 
setinverse = setinverse,
getinverse = getinverse)
}

cacheSolve <- function(x, ...) {               ## CacheSolve returns inverse of matrix created with makeCacheMatrix 
m <- x$getinverse()                            ## Returns a matrix inverse of 'x'
if( !is.null(m) ) {                            ## Returns inverse if its already set 
message("getting cached data")
return(m)
}
data <- x$get()                                ## Gets matrix from object
m <- solve(data) %*% data                      ## Matrix multiplication calculates inverse
x$setinverse(m)                                ## Sets inverse to object
m                                              ## Returns matrix
}
