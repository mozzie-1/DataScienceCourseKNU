## 1. Функція add2(x, y), яка повертає суму двох чисел.

```{R}
add2 <- function(x,y) 
        {
          x+y
        }
> add2(11.23,4567.8)
[1] 4579.03
```
## 2. Функція above(x, n), яка приймає вектор та число n, та повертає всі елементі вектору, які більше n. По замовчуванню n = 10.

```{R}
above<- function(x,n=10) 
        {
          x1=x[x>n]
          return(x1)
        }

> above(test<-c(30, 12, 66, 5, 2, 14, 10))
[1] 30 12 66 14
```

## 3. Функція my_ifelse(x, exp, n), яка приймає вектор x, порівнює всі його елементи за допомогою exp з n, та повертає елементи вектору, які відповідають умові expression. Наприклад, my_ifelse(x, “>”, 0) повертає всі елементи x, які більші 0. Exp може дорівнювати “<”, “>”, “<=”, “>=”, “==”. Якщо exp не співпадає ні з одним з цих виразів, повертається вектор x.

```{R}
my_ifelse <- function(x, exp, n) 
            { 
                  if (exp == "<")        {
                            X1=x[x<n] 
                  } else if(exp == "<=") {
                            X1=x[x<=n]
                  } else if(exp == ">")  {
                            X1=x[x>n]
                  } else if(exp == ">=") {
                            X1=x[x>=n]
                  } else if(exp == "==") {
                            X1=x[x==n]
                  } else { 
                            X1=x
                         }
                  return(X1)
            }
                  
> my_ifelse(test,"<",20)
[1] 12  5  2 14 10
> my_ifelse(test,"=<=",10) 
[1] 30 12 66  5  2 14 10
> my_ifelse(test,"==",5) 
[1] 5
> my_ifelse(test,">=",33) 
[1] 66
```
## 4. Функція columnmean(x, removeNA), яка розраховує середнє значення (mean) по кожному стовпцю матриці, або data frame. Логічний параметр removeNA вказує, чи видаляти NA значення. По замовчуванню він дорівнює TRUE.

```{R}
columnmean<- function(x, removeNA=TRUE) 
            {
             apply(x,2,mean, na.rm = removeNA) # applies function 'mean' to 2nd dimension (columns)
            }
             
> matrix1 <- matrix(c(0.4, 2.3, NA, 1, 1.5, NA, 32, 4, 0.5, 2.3, 1.6, 2.2), nrow = 4, ncol = 3)
> matrix1
     [,1] [,2] [,3]
[1,]  0.4  1.5  0.5
[2,]  2.3   NA  2.3
[3,]   NA 32.0  1.6
[4,]  1.0  4.0  2.2

> columnmean(matrix1)
[1]  1.233333 12.500000  1.650000

> columnmean(matrix1,removeNA=FALSE)
[1]   NA   NA 1.65
```
