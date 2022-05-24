## 1. Написати функцію pmean, яка обчислює середнє значення (mean) забруднення сульфатами або нітратами серед заданого переліка моніторів. Ця функція приймає три аргументи: «directory», «pollutant», «id». Directory – папка, в якій розміщені дані, pollutant – вид забруднення, id – перелік моніторів. Аргумент id має значення за замовчуванням 1:332. Функція повинна ігнорувати NA значення. Приклад роботи функції: pmean("specdata", "sulfate", 1:10)


```{R}
> pmean <- function(directory, pollutant, id=1:332){
     allfiles <- list.files(path=directory, pattern=".csv", full.names=TRUE)
     nodata <- numeric()
     
     for (i in id){
         data <- read.csv(allfiles[i])
         nodata <- c(nodata, data[[pollutant]])
     }
     
     mean(nodata, na.rm = TRUE)
 }
 
 > pmean("specdata", "sulfate", 50:150)
[1] 3.491151

> pmean("specdata", "sulfate", 105)
[1] 5.01654

> pmean("specdata", "nitrate")
[1] 1.702932
```

## 2. Написати функцію complete, яка виводить кількість повних спостережень (the number of completely observed cases) для кожного файлу. Функція приймає два аргументи: «Directory» та «id» та повертає data frame, в якому перший стовпчик – ім’я файлу, а другий – кількість повних спостережень. Приклад роботи функції: complete("specdata", 1)


```{R}
> complete <- function(directory, id=1:332){
     allfiles <- list.files(path=directory, pattern=".csv", full.names=TRUE)
     nodata <- numeric()
     
     for (i in id){
        data <- read.csv(allfiles[i])
         nodata <- c(nodata, sum(complete.cases(data)))
     }
     
     data.frame(id, nodata)
 }
 
 > complete("specdata", 5)
  id nodata
1  5    402

> complete("specdata", c(4, 6, 7, 12, 15))
  id nodata
1  4    474
2  6    228
3  7    442
4 12     96
5 15     83

> complete("specdata", 100:115)
    id nodata
1  100    104
2  101     64
3  102    145
4  103    439
5  104    385
6  105    237
7  106     74
8  107      7
9  108    454
10 109    223
11 110    234
12 111    329
13 112    242
14 113    348
15 114    753
16 115    177


```

## 3. Написати функцію corr, яка приймає два аргументи: directory (папка, де знаходяться файли спостережень) та threshold (порогове значення, за замовчуванням дорівнює 0) та обчислює кореляцію між сульфатами та нітратами для моніторів, кількість повних спостережень для яких більше порогового значення. Функція повинна повернути вектор значень кореляцій. Якщо ні один монітор не перевищує порогового значення, функція повинна повернути numeric вектор довжиною 0. Для обчислення кореляції між сульфатами та нітратами використовуйте вбудовану функцію «cor» з параметрами за замовчуванням. Приклад роботи функції: cr <- corr("specdata", 150) head(cr); summary(cr)

```{R}
corr <- function(directory, threshold = 0) {
    id = 1:332
    filename <- list.files(directory, full.names = TRUE)
    
    result <-vector("numeric", length=0)
    
    for(i in seq(filename)) {
        airquality <- read.csv(filename[i])
        good <- complete.cases(airquality)
        airquality <- airquality[good, ]
        if (nrow(airquality) > threshold) {
            
            correlation <- cor(airquality[["sulfate"]], airquality[["nitrate"]])
            result <- append(result, correlation)
            
        }
    }
    result
}
 
> cr <- corr("specdata", 120)

> head(cr)
[1] -0.01895754 -0.14051254 -0.04389737 -0.06815956 -0.12350667
[6] -0.07588814

> summary(cr)
    Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
-0.28827 -0.05735  0.08940  0.11728  0.26339  0.76313 

> cr <- corr("specdata", 400)

> head(cr)
[1] -0.01895754 -0.04389737 -0.06815956 -0.07588814  0.76312884
[6] -0.15782860

> summary(cr)
    Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
-0.17623 -0.03109  0.10021  0.13969  0.26849  0.76313 

 cr <- corr("specdata", 4500)
 
> head(cr)
numeric(0)

> summary(cr)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
   
> length(cr)
[1] 0
```
