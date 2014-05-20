### CacheMatrix assignment solution

This repository holds the solution for the
 [second programming assignment](https://class.coursera.org/rprog-003/human_grading/view/courses/972138/assessments/3/submissions)
 in the "R programming" course.

### Content

The file `cachematrix.R` contains two functions for computing the inverse of a matrix and storing it in the cache:
1.	The `makeCacheMatrix` function returns a list of API functions that can be used to retrieve and set the underlying matrix and the cached result.

2.	The `cacheSolve` function accepts a CacheMatrix object and returns its inverse. It tries to fetch the cached result first,
and if it's null the function will calculate the inverse and store it in the cache for future calls.

### Usage
The two functions should be used together. For example:
```
> m <- matrix(c(2,0,0,1),2,2)
> cm <- makeCacheMatrix(m)
> cacheSolve(cm)

     [,1] [,2]
[1,]  0.5    0
[2,]  0.0    1

> cacheSolve(cm)

Getting result from cache
     [,1] [,2]
[1,]  0.5    0
[2,]  0.0    1
```