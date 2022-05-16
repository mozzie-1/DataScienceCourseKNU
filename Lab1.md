1. Створити змінні базових (atomic) типів. Базові типи: character, numeric, 
integer, complex, logical.

> x <- 81
> y <- 5L
> z <- FALSE
> t <- "clear"
> u <- 10-3i
> class(x) 
[1] "numeric" 
> class(y) 
[1] "integer"
> class(z) 
[1] "logical" 
> class(t) 
[1] "character" 
> class(u) 
[1] "complex"
-------------------------------------------
2. Створити вектори, які: містить послідовність з 5 до 75; містить числа 3.14, 
2.71, 0, 13; 100 значень TRUE.

> x <- 5:75 
> x 
 [1]  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 
[25] 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 
[49] 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 

> x <- c(3.14, 2.71, 0, 13) 
> x 
[1]  3.14  2.71  0.00 13.00

x <-rep(TRUE,100) #logical
print (x)
  [1] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [13] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [25] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [37] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [49] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [61] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [73] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [85] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [97] TRUE TRUE TRUE TRUE
-------------------------------------------------------------------------------
3. Створити наступну матрицю за допомогою matrix, та за допомогою cbind
або rbind
0.5 1.3 3.5
3.9 131 2.8
0 2.2 4.6
2 7 5.1

> m <- matrix(c(0.5, 3.9, 0, 2, 1.3, 131, 2.2, 7, 3.5, 2.8, 4.6, 5.1), nrow = 4, ncol = 3)
> m
     [,1]  [,2] [,3]
[1,]  0.5   1.3  3.5
[2,]  3.9 131.0  2.8
[3,]  0.0   2.2  4.6
[4,]  2.0   7.0  5.1

> x <- c(0.5, 3.9, 0, 2)
> y <- c(1.3, 131, 2.2, 7)
> z <- c(3.5, 2.8, 4.6, 5.1)
> cbind(x,y,z)
       x     y   z
[1,] 0.5   1.3 3.5
[2,] 3.9 131.0 2.8
[3,] 0.0   2.2 4.6
[4,] 2.0   7.0 5.1
---------------------------------------------
4. Створити довільний список (list), в який включити всі базові типи

> a <- list(1, "a", 2L, TRUE, 1 + 4i) 
> a 
[[1]] 
[1] 1 
 
[[2]] 
[1] "a" 
 
[[3]] 
[1] 2 
 
[[4]] 
[1] TRUE 
 
[[5]] 
[1] 1+4i
--------------------------------------------------------------------------
5. Створити фактор з трьома рівнями «baby», «child», «adult».

> x <- factor(c("baby", "child", "adult", "baby", "child", "adult", "baby"))
> x 
[1] baby  child adult baby  child adult baby  
Levels: adult baby child
--------------------------------------------------------------------------
6. Знайти індекс першого значення NA в векторі 1, 2, 3, 4, NA, 6, 7, NA, 9, NA, 
11. Знайти кількість значень NA.

> x <- c(1, 2, 3, 4, NA, 5, 6, 7, NA, 9, NA, 11)
> which(is.na(x)) 
[1]  5  9 11
> sum(is.na(x)) 
[1] 3
--------------------------------------------------------------------------
7. Створити довільний data frame та вивести в консоль.

x <- data.frame(Plus = 2:5, Minus = c(F, F, T, F)) 
> x 
  Plus Minus 
1    2 FALSE 
2    3 FALSE 
3    4  TRUE 
4    5 FALSE
---------------------------------------------------------------------------

8. Змінити імена стовпців цього data frame.

> colnames(x) <- c("be", "bao") 
> x 
  be   bao 
1  2 FALSE 
2  3 FALSE 
3  4  TRUE 
4  5 FALSE
