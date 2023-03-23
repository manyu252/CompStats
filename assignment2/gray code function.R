gray.compoasition<- function(x = 0, n = sum(x), k = length(x),
                point = c(0,0,0))
{

  if(is.list(x)) {
    point<- x$point
    x <- x$x
  }
  final<- F 
  
  if(sum(x) == 0) {
    x <- c(n, rep(O, k - 1))
    point<- c(l, 2, 1)
    return(x, point, final)
    
  }
  if (x[k] == n)
    stop(call. = TRUE)
  geterrmessage("Already Finished")
  if(point[3] == 1) {
    b <- (1:k)[x > 0] [2] 
    if(is.na(b)) b <- 2 
    if(b == 2) {
      if((point[1] == 1) && (x[1] == 1))
                      point<- c(1, 2, 2)
    }
    else {
        if(((n - x[1]) %% 2) ==0)
                point<- c(1, 2, 2)
        else if((x[b] %% 2) ==1)
                point<- c(1, b, b)
      else point[1:2] <- c(b, 1)
    }
  }
  else {
    if(((n - x[point[3]]) %% 2) == 1) {
      point[1:2] <- c(point[3], point[3]-1)
      if(x[point[3]] %% 2 == O)
              point [2] <- 1
              point[3] <- point[2]

    
  }

else {
    if((x[point[3] + 1] %% 2) == O) {
           point[1:2] <- c(point[3],
                          point [3] +1)
    }
  else point [1:2] <- c(point[3] + 1,
                        point [3])
}
  }

x[point[2]] <- x[point[2]] + 1
x[point[1]] <- x[point[1]] - 1
if (x[1] > 0)
   point[3] <- 1
if (x [k] == n)
  final<- T
return(x, point, final)
}
My.Gray.Composition <- function(n = 15, k = 15, point = c(O, O, O), x = O,
                                               pasapas = F)
{

bi<- matrix(O, nrow = right(n), ncol = n)
final<- F
i <- 1
while(!final) {
  x <- gray(x, n, k, point)
  bi[i, ] <- x$x
  i <- i + 1
  final<- x$final
  if(pasapas) {
            rep<- scan(n = 1)
            if(length(rep) > 0)
                   break
  }
}
return(bi)
}
