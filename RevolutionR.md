---
title: "國泰人壽 Revolution R"
author: "David Chiu"
date: "2016/9/13"
output: html_document
---

## 用R做簡單迴歸分析

```r
data(anscombe)
plot(y1 ~ x1, data = anscombe) 
lmfit <- lm(y1~x1, data=anscombe)
abline(lmfit, col="red") 
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-1-1.png) 

## 變數與數學運算

```r
RRP <- 35.99
Exchange <- 31.74
NTD <- RRP * Exchange
NTD
```

```
## [1] 1142.323
```

## 使用向量存放多個變數的資料

```r
# 不同型態的向量
height_vec <- c(180,169,173)
name_vec <- c("Brian", "Toby", "Sherry")
```

## 使用向量計算

```r
height_vec <- c(180,169,173)
weight_vec <- c(73, 87, 43)
names_vec <- c('Brian', 'Toby', 'Sherry')

bmi_vec <- weight_vec / (height_vec / 100) ^ 2
names(bmi_vec) = names_vec

bmi_vec[bmi_vec < 18.5 | bmi_vec >= 24]
```

```
##     Toby   Sherry 
## 30.46112 14.36734
```

## 矩陣可以存放二維向量

```r
kevin <- c(85,73)
marry <- c(72,64)
jerry <- c(59,66)
mat <- matrix(c(kevin, marry, jerry), nrow=3, byrow= TRUE)
weighted_score <- mat[,1] * 0.4 + mat[,2] * 0.6
```

## 表示類別資料(Factor)

```r
weather <- c("sunny","rainy", "cloudy", "rainy", "cloudy")
weather_category <- factor(weather)
weather_category
```

```
## [1] sunny  rainy  cloudy rainy  cloudy
## Levels: cloudy rainy sunny
```

```r
levels(weather_category)
```

```
## [1] "cloudy" "rainy"  "sunny"
```

## 使用list 包裝不同類型資料

```r
#使用list 包裝類型不同的資料
person <- list(name='James', height=180, Employ=TRUE)
person
```

```
## $name
## [1] "James"
## 
## $height
## [1] 180
## 
## $Employ
## [1] TRUE
```

```r
#使用lapply 套用函式到list 裡面的元素
li = list( c(98,82,66,54), c(83,72,77))
lapply(li, sum)
```

```
## [[1]]
## [1] 300
## 
## [[2]]
## [1] 232
```

## Data Frame


```r
data(iris)
class(iris)
```

```
## [1] "data.frame"
```

## 檢視 Data Frame

```r
# 檢視資料形態
class(df)
```

```
## [1] "data.frame"
```

```r
# 檢視架構
str(df)
```

```
## 'data.frame':	100000 obs. of  7 variables:
##  $ default_RegPred: num  0 0 0 0 0 0 0 0 0 0 ...
##  $ default        : int  0 0 0 0 0 0 0 0 0 0 ...
##  $ creditScore    : int  691 691 743 728 745 539 724 659 621 720 ...
##  $ ccDebt         : int  6725 5077 3080 4345 2969 4588 4057 6456 1861 4568 ...
##  $ yearsEmploy    : int  9 4 3 1 3 3 5 3 3 7 ...
##  $ houseAge       : int  16 4 18 22 17 15 6 14 18 14 ...
##  $ year           : int  2000 2000 2000 2000 2000 2000 2000 2000 2000 2000 ...
```

```r
# 檢視資料摘要
summary(df)
```

```
##  default_RegPred     default         creditScore        ccDebt     
##  Min.   :0.0000   Min.   :0.00000   Min.   :470.0   Min.   :    0  
##  1st Qu.:0.0000   1st Qu.:0.00000   1st Qu.:666.0   1st Qu.: 3656  
##  Median :0.0000   Median :0.00000   Median :700.0   Median : 4999  
##  Mean   :0.0012   Mean   :0.00471   Mean   :699.9   Mean   : 5004  
##  3rd Qu.:0.0000   3rd Qu.:0.00000   3rd Qu.:734.0   3rd Qu.: 6357  
##  Max.   :0.0625   Max.   :1.00000   Max.   :925.0   Max.   :14094  
##   yearsEmploy        houseAge          year     
##  Min.   : 0.000   Min.   : 0.00   Min.   :2000  
##  1st Qu.: 4.000   1st Qu.:15.00   1st Qu.:2002  
##  Median : 5.000   Median :20.00   Median :2004  
##  Mean   : 5.003   Mean   :19.96   Mean   :2004  
##  3rd Qu.: 6.000   3rd Qu.:25.00   3rd Qu.:2007  
##  Max.   :14.000   Max.   :40.00   Max.   :2009
```

```r
# 觀看前幾筆資料
head(iris)
```

```
##   Sepal.Length Sepal.Width Petal.Length Petal.Width Species
## 1          5.1         3.5          1.4         0.2  setosa
## 2          4.9         3.0          1.4         0.2  setosa
## 3          4.7         3.2          1.3         0.2  setosa
## 4          4.6         3.1          1.5         0.2  setosa
## 5          5.0         3.6          1.4         0.2  setosa
## 6          5.4         3.9          1.7         0.4  setosa
```

```r
head(iris, 10)
```

```
##    Sepal.Length Sepal.Width Petal.Length Petal.Width Species
## 1           5.1         3.5          1.4         0.2  setosa
## 2           4.9         3.0          1.4         0.2  setosa
## 3           4.7         3.2          1.3         0.2  setosa
## 4           4.6         3.1          1.5         0.2  setosa
## 5           5.0         3.6          1.4         0.2  setosa
## 6           5.4         3.9          1.7         0.4  setosa
## 7           4.6         3.4          1.4         0.3  setosa
## 8           5.0         3.4          1.5         0.2  setosa
## 9           4.4         2.9          1.4         0.2  setosa
## 10          4.9         3.1          1.5         0.1  setosa
```

```r
# 觀看後幾筆資料
tail(iris)
```

```
##     Sepal.Length Sepal.Width Petal.Length Petal.Width   Species
## 145          6.7         3.3          5.7         2.5 virginica
## 146          6.7         3.0          5.2         2.3 virginica
## 147          6.3         2.5          5.0         1.9 virginica
## 148          6.5         3.0          5.2         2.0 virginica
## 149          6.2         3.4          5.4         2.3 virginica
## 150          5.9         3.0          5.1         1.8 virginica
```

```r
tail(iris, 10)
```

```
##     Sepal.Length Sepal.Width Petal.Length Petal.Width   Species
## 141          6.7         3.1          5.6         2.4 virginica
## 142          6.9         3.1          5.1         2.3 virginica
## 143          5.8         2.7          5.1         1.9 virginica
## 144          6.8         3.2          5.9         2.3 virginica
## 145          6.7         3.3          5.7         2.5 virginica
## 146          6.7         3.0          5.2         2.3 virginica
## 147          6.3         2.5          5.0         1.9 virginica
## 148          6.5         3.0          5.2         2.0 virginica
## 149          6.2         3.4          5.4         2.3 virginica
## 150          5.9         3.0          5.1         1.8 virginica
```

## 取得指定列與行的部分資料集

```r
#取前三列資料
iris[1:3,]
```

```
##   Sepal.Length Sepal.Width Petal.Length Petal.Width Species
## 1          5.1         3.5          1.4         0.2  setosa
## 2          4.9         3.0          1.4         0.2  setosa
## 3          4.7         3.2          1.3         0.2  setosa
```

```r
#取前三列第一行的資料
iris[1:3,1]
```

```
## [1] 5.1 4.9 4.7
```

```r
#也可以用欄位名稱取值
iris[1:3,"Sepal.Length"]
```

```
## [1] 5.1 4.9 4.7
```

```r
#取前兩行資料
head(iris[,1:2])
```

```
##   Sepal.Length Sepal.Width
## 1          5.1         3.5
## 2          4.9         3.0
## 3          4.7         3.2
## 4          4.6         3.1
## 5          5.0         3.6
## 6          5.4         3.9
```

```r
#取特定欄位向量值
iris$"Sepal.Length"
```

```
##   [1] 5.1 4.9 4.7 4.6 5.0 5.4 4.6 5.0 4.4 4.9 5.4 4.8 4.8 4.3 5.8 5.7 5.4
##  [18] 5.1 5.7 5.1 5.4 5.1 4.6 5.1 4.8 5.0 5.0 5.2 5.2 4.7 4.8 5.4 5.2 5.5
##  [35] 4.9 5.0 5.5 4.9 4.4 5.1 5.0 4.5 4.4 5.0 5.1 4.8 5.1 4.6 5.3 5.0 7.0
##  [52] 6.4 6.9 5.5 6.5 5.7 6.3 4.9 6.6 5.2 5.0 5.9 6.0 6.1 5.6 6.7 5.6 5.8
##  [69] 6.2 5.6 5.9 6.1 6.3 6.1 6.4 6.6 6.8 6.7 6.0 5.7 5.5 5.5 5.8 6.0 5.4
##  [86] 6.0 6.7 6.3 5.6 5.5 5.5 6.1 5.8 5.0 5.6 5.7 5.7 6.2 5.1 5.7 6.3 5.8
## [103] 7.1 6.3 6.5 7.6 4.9 7.3 6.7 7.2 6.5 6.4 6.8 5.7 5.8 6.4 6.5 7.7 7.7
## [120] 6.0 6.9 5.6 7.7 6.3 6.7 7.2 6.2 6.1 6.4 7.2 7.4 7.9 6.4 6.3 6.1 7.7
## [137] 6.3 6.4 6.0 6.9 6.7 6.9 5.8 6.8 6.7 6.7 6.3 6.5 6.2 5.9
```

## 使用條件篩選資料

```r
#取前五筆包含length 及 width 的資料
five.Sepal.iris <- iris[1:5, c("Sepal.Length", "Sepal.Width")]

#可以用條件做篩選
setosa.data <- iris[iris$Species=="setosa",1:5]
```

## 資料排序


```r
#用Sort 作資料排序
sort(iris$Sepal.Length, decreasing = TRUE)
```

```
##   [1] 7.9 7.7 7.7 7.7 7.7 7.6 7.4 7.3 7.2 7.2 7.2 7.1 7.0 6.9 6.9 6.9 6.9
##  [18] 6.8 6.8 6.8 6.7 6.7 6.7 6.7 6.7 6.7 6.7 6.7 6.6 6.6 6.5 6.5 6.5 6.5
##  [35] 6.5 6.4 6.4 6.4 6.4 6.4 6.4 6.4 6.3 6.3 6.3 6.3 6.3 6.3 6.3 6.3 6.3
##  [52] 6.2 6.2 6.2 6.2 6.1 6.1 6.1 6.1 6.1 6.1 6.0 6.0 6.0 6.0 6.0 6.0 5.9
##  [69] 5.9 5.9 5.8 5.8 5.8 5.8 5.8 5.8 5.8 5.7 5.7 5.7 5.7 5.7 5.7 5.7 5.7
##  [86] 5.6 5.6 5.6 5.6 5.6 5.6 5.5 5.5 5.5 5.5 5.5 5.5 5.5 5.4 5.4 5.4 5.4
## [103] 5.4 5.4 5.3 5.2 5.2 5.2 5.2 5.1 5.1 5.1 5.1 5.1 5.1 5.1 5.1 5.1 5.0
## [120] 5.0 5.0 5.0 5.0 5.0 5.0 5.0 5.0 5.0 4.9 4.9 4.9 4.9 4.9 4.9 4.8 4.8
## [137] 4.8 4.8 4.8 4.7 4.7 4.6 4.6 4.6 4.6 4.5 4.4 4.4 4.4 4.3
```

```r
#用order做資料排序
head(iris[order(iris$Sepal.Length, decreasing = TRUE),])
```

```
##     Sepal.Length Sepal.Width Petal.Length Petal.Width   Species
## 132          7.9         3.8          6.4         2.0 virginica
## 118          7.7         3.8          6.7         2.2 virginica
## 119          7.7         2.6          6.9         2.3 virginica
## 123          7.7         2.8          6.7         2.0 virginica
## 136          7.7         3.0          6.1         2.3 virginica
## 106          7.6         3.0          6.6         2.1 virginica
```

## 使用繪圖元件探索資料

```r
#Pie Chart
table.iris = table(iris$Species)
pie(table.iris)
```

![plot of chunk unnamed-chunk-13](figure/unnamed-chunk-13-1.png) 

```r
#Histogram
hist(iris$Sepal.Length)
```

![plot of chunk unnamed-chunk-13](figure/unnamed-chunk-13-2.png) 

```r
#Box Plot
boxplot(Petal.Width ~ Species, data = iris)
```

![plot of chunk unnamed-chunk-13](figure/unnamed-chunk-13-3.png) 

```r
#Scatter Plot
plot(x=iris$Petal.Length, y=iris$Petal.Width, col=iris$Species)
```

![plot of chunk unnamed-chunk-13](figure/unnamed-chunk-13-4.png) 

## 使用R 作機器學習

```r
#安裝rpart 套件
##install.packages('rpart')

#讀取rpart 套件
library(rpart)

#建立模型
fit <- rpart(Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width,data= iris)

#繪製模型
plot(fit, margin = 0.1)
text(fit)
```

![plot of chunk unnamed-chunk-14](figure/unnamed-chunk-14-1.png) 

## RevoScaleR 的選項


```r
#瀏覽可用RevoScaleR選項
names(rxOptions())
```

```
##  [1] "libDir"                "linkDllName"          
##  [3] "unitTestDir"           "unitTestDataDir"      
##  [5] "sampleDataDir"         "demoScriptsDir"       
##  [7] "fileSystem"            "hdfsPort"             
##  [9] "hdfsHost"              "xdfCompressionLevel"  
## [11] "numTasks"              "computeContext"       
## [13] "blocksPerRead"         "reportProgress"       
## [15] "rowDisplayMax"         "memStatsReset"        
## [17] "memStatsDiff"          "numCoresToUse"        
## [19] "numDigits"             "showTransformFn"      
## [21] "defaultDecimalColType" "defaultMissingColType"
## [23] "dataPath"              "outDataPath"          
## [25] "transformPackages"     "useSparseCube"        
## [27] "rngBufferSize"         "dropMain"             
## [29] "coefLabelStyle"        "unixRPath"            
## [31] "mrsHadoopPath"         "defaultDataDir"       
## [33] "reset"
```

```r
#取得當前reportProgress 選項
rxGetOption("reportProgress")
```

```
## [1] 2
```

```r
#將reportProgress 設為0
rxOptions(reportProgress = 0)
```

## 使用RevoScale R 讀取資料

```r
#設定csv資料來源
input <- RxTextData(
    file = "lvr_prices.csv", 
    delimiter = ",", 
    quotedDelimiters=TRUE)

#使用rxImport 將資料匯入 
rxImport(inData = input,
        outFile = 'lvr.xdf', 
        overwrite = TRUE)
```

## 讀取xdf 檔案資訊

```r
#設定檔案路徑
lvr_data <- file.path('/home/largitdata','lvr.xdf')

#取得資料
rxGetInfo(lvr_data)
```

```
## File name: /home/largitdata/lvr.xdf 
## Number of observations: 102054 
## Number of variables: 29 
## Number of blocks: 1 
## Compression type: zlib
```

## 取得xdf 變數資訊

```r
#取得xdf 的變數資訊
rxGetInfo(lvr_data, getVarInfo = TRUE)
```

```
## File name: /home/largitdata/lvr.xdf 
## Number of observations: 102054 
## Number of variables: 29 
## Number of blocks: 1 
## Compression type: zlib 
## Variable information: 
## Var 1: .rxRowNames, Type: integer, Low/High: (0, 9683)
## Var 2: area, Type: character
## Var 3: trading_target, Type: character
## Var 4: address, Type: character
## Var 5: land_sqmeter, Type: numeric, Storage: float32, Low/High: (0.0000, 46193.0000)
## Var 6: city_land_type, Type: character
## Var 7: non_city_land_type, Type: character
## Var 8: non_city_code, Type: numeric, Storage: float32, Low/High: (NA, NA)
## Var 9: trading_ymd, Type: character
## Var 10: trading_num, Type: character
## Var 11: floor, Type: character
## Var 12: total_floor, Type: character
## Var 13: building_type, Type: character
## Var 14: main_purpose, Type: character
## Var 15: built_with, Type: character
## Var 16: finish_ymd, Type: character
## Var 17: building_sqmeter, Type: numeric, Storage: float32, Low/High: (0.0000, 69125.5312)
## Var 18: room, Type: integer, Low/High: (0, 168)
## Var 19: living_room, Type: integer, Low/High: (0, 80)
## Var 20: bath, Type: integer, Low/High: (0, 174)
## Var 21: compartment, Type: character
## Var 22: management, Type: character
## Var 23: total_price, Type: integer, Low/High: (-2094967296, 2028880000)
## Var 24: price_per_sqmeter, Type: numeric, Storage: float32, Low/High: (0.0000, 62685712.0000)
## Var 25: parking_type, Type: character
## Var 26: parking_sqmeter, Type: numeric, Storage: float32, Low/High: (0.0000, 1450000.0000)
## Var 27: parking_price, Type: integer, Low/High: (0, 2.4e+08)
## Var 28: comments, Type: character
## Var 29: numbers, Type: character
```

## 指定欄位型態

```r
lvr_colInfo <- list(
    list(index = 2, type = "factor"),
    list(index = 23, type = "numeric")
    )

input <- RxTextData(file="lvr_prices.csv", delimiter = ",", quotedDelimiters=TRUE, colInfo =lvr_colInfo)
```

## 使用Transforms 轉換日期資訊

```r
# 轉換日期資訊
rxImport(inData= input, 
         outFile = 'lvr.xdf', 
         overwrite = TRUE,
          transforms = list(
	 trading_ymd = as.Date(trading_ymd, format="%Y-%m-%d"),
	 finish_ymd = as.Date(finish_ymd, format="%Y-%m-%d")
          )
)
```

## 使用rxGetVarInfo抓取最高與最低價格

```r
#設定xdf 檔案路徑
lvr_data <- file.path('/home/largitdata','lvr.xdf')

#取得最高價格
rxGetVarInfo(lvr_data)$total_price$high
```

```
## [1] 2.7034e+10
```

```r
#取得最低價格
rxGetVarInfo(lvr_data)$total_price$low
```

```
## [1] 0
```


## 篩選資料並轉回Data Frame

```r
lvr_df <- rxDataStep(
      inData=lvr_data,
      rowSelection = (price_per_sqmeter <= 200000),
      numRows = 1000,
      varsToKeep = c('area','address', 'trading_ymd', 'total_price')
      )
```

## 計算每平方公尺的成交價格

```r
rxDataStep(
  inData  = lvr_data, 
  outFile = lvr_data,
  transforms = list(
    new_price = total_price / building_sqmeter
    ),
  append = "cols",
  overwrite = TRUE
)
```

## 取得資料的敘述性統計

```r
#取得總價格的敘述性統計
rxSummary(formula= ~total_price, data=lvr_data)
```

```
## Call:
## rxSummary(formula = ~total_price, data = lvr_data)
## 
## Summary Statistics Results for: ~total_price
## Data: lvr_data (RxXdfData Data Source)
## File name: /home/largitdata/lvr.xdf
## Number of valid observations: 102054 
##  
##  Name        Mean     StdDev    Min Max        ValidObs MissingObs
##  total_price 25445200 126047791 0   2.7034e+10 102054   0
```

```r
#取得總價格、車位價格與區域的敘述性統計
rxSummary(
          formula= ~total_price + parking_price + area, data=lvr_data
)
```

```
## Call:
## rxSummary(formula = ~total_price + parking_price + area, data = lvr_data)
## 
## Summary Statistics Results for: ~total_price + parking_price +
##     area
## Data: lvr_data (RxXdfData Data Source)
## File name: /home/largitdata/lvr.xdf
## Number of valid observations: 102054 
##  
##  Name          Mean       StdDev    Min Max        ValidObs MissingObs
##  total_price   25445199.9 126047791 0   2.7034e+10 102054   0         
##  parking_price   488509.3   1981906 0   2.4000e+08 102054   0         
## 
## Category Counts for area
## Number of categories: 12
## Number of valid observations: 102054
## Number of missing observations: 0
## 
##  area   Counts
##  大安區  9383 
##  中正區  5655 
##  大同區  4285 
##  內湖區 12312 
##  信義區  7458 
##  松山區  6250 
##  士林區  8878 
##  中山區 15020 
##  萬華區  6531 
##  北投區 10278 
##  文山區 10572 
##  南港區  5432
```

##　繪製Histogram

```r
# 使用rxHistogram繪製總價分佈
rxHistogram(formula= ~total_price, data=lvr_data)
```

![plot of chunk unnamed-chunk-25](figure/unnamed-chunk-25-1.png) 

## 使用Transforms 轉換尺度

```r
rxHistogram(formula= ~ total_price, 
         data=lvr_data, 
         transforms = list(total_price = log10(total_price))
        )	
```

![plot of chunk unnamed-chunk-26](figure/unnamed-chunk-26-1.png) 

## 依不同變量繪圖 (Facet)

```r
#使用rxHistogram做 Facet
rxHistogram(~ total_price | area, data=lvr_data, transforms=list(total_price= log(total_price)))
```

![plot of chunk unnamed-chunk-27](figure/unnamed-chunk-27-1.png) 

## 計算各區的平均價格

```r
#使用rxCrossTabs 建立列聯表(Contingency Table)
lvr_tabs <- rxCrossTabs(formula = total_price ~ area, data=lvr_data)

#使用Print 函式列出各區域平均價格
print(lvr_tabs, output="means")
```

```
## Call:
## rxCrossTabs(formula = total_price ~ area, data = lvr_data)
## 
## Cross Tabulation Results for: total_price ~ area
## Data: lvr_data (RxXdfData Data Source)
## File name: /home/largitdata/lvr.xdf
## Dependent variable(s): total_price
## Number of valid observations: 102054
## Number of missing observations: 0 
## Statistic: means 
##  
## total_price (means):
##                
## 大安區 32024196
## 中正區 32426625
## 大同區 18994617
## 內湖區 30404023
## 信義區 30745770
## 松山區 26351701
## 士林區 24139903
## 中山區 27568870
## 萬華區 15268796
## 北投區 21284915
## 文山區 16953869
## 南港區 25235793
```

```r
#使用Print 函式列出各區域成交次數
print(lvr_tabs, output="counts")
```

```
## Call:
## rxCrossTabs(formula = total_price ~ area, data = lvr_data)
## 
## Cross Tabulation Results for: total_price ~ area
## Data: lvr_data (RxXdfData Data Source)
## File name: /home/largitdata/lvr.xdf
## Dependent variable(s): total_price
## Number of valid observations: 102054
## Number of missing observations: 0 
## Statistic: counts 
##  
## total_price (counts):
##             
## 大安區  9383
## 中正區  5655
## 大同區  4285
## 內湖區 12312
## 信義區  7458
## 松山區  6250
## 士林區  8878
## 中山區 15020
## 萬華區  6531
## 北投區 10278
## 文山區 10572
## 南港區  5432
```

## 套用summary 在列聯表上

```r
#找出總成交金額比例最高的區域
summary(lvr_tabs)
```

```
## Call:
## rxCrossTabs(formula = total_price ~ area, data = lvr_data)
## 
## Cross Tabulation Results for: total_price ~ area
## File name: /home/largitdata/lvr.xdf
## Dependent variable(s): total_price
## Number of valid observations: 102054
## Number of missing observations: 0 
## Statistic: sums 
##  
## total_price (sums):
##                sums     sums %
## 大安區 3.004830e+11  11.571351
## 中正區 1.833726e+11   7.061524
## 大同區 8.139193e+10   3.134335
## 內湖區 3.743343e+11  14.415303
## 信義區 2.293020e+11   8.830227
## 松山區 1.646981e+11   6.342387
## 士林區 2.143141e+11   8.253056
## 中山區 4.140844e+11  15.946045
## 萬華區 9.972051e+10   3.840153
## 北投區 2.187664e+11   8.424510
## 文山區 1.792363e+11   6.902240
## 南港區 1.370808e+11   5.278868
## Total  2.596784e+12 100.000000
```

```r
#找出平均成交金額比例最高的區域
summary(lvr_tabs, output="means", type="%")
```

```
## Call:
## rxCrossTabs(formula = total_price ~ area, data = lvr_data)
## 
## Cross Tabulation Results for: total_price ~ area
## File name: /home/largitdata/lvr.xdf
## Dependent variable(s): total_price
## Number of valid observations: 102054
## Number of missing observations: 0 
## Statistic: means 
##  
## total_price (means):
##             means   means %
## 大安區   32024196 10.625181
## 中正區   32426625 10.758701
## 大同區   18994617  6.302148
## 內湖區   30404023 10.087630
## 信義區   30745770 10.201017
## 松山區   26351701  8.743126
## 士林區   24139903  8.009282
## 中山區   27568870  9.146965
## 萬華區   15268796  5.065973
## 北投區   21284915  7.062037
## 文山區   16953869  5.625057
## 南港區   25235793  8.372883
## Col Mean 25445200
```

## 根據購買總價排序

```r
barplot(sort(lvr_tabs$sums$total_price, decreasing = TRUE))
```

![plot of chunk unnamed-chunk-30](figure/unnamed-chunk-30-1.png) 

## 轉換成交易月份

```r
rxDataStep(
         inData=lvr_data, 
         outFile=lvr_data,
         transforms=list(
         trading_ym = as.Date(format(as.Date(trading_ymd), '%Y-%m-01'))
         ),
         overwrite = TRUE,
         append="cols"
)
```

## 算出區域在不同月份的總成交價與件數

```r
rxCube(
  formula = total_price ~ area :trading_ym, 
  data=lvr_data, 
  outFile = 'lvr_cube.xdf', 
  overwrite = TRUE,
  mean = FALSE,
  transforms=list(trading_ym = as.factor(trading_ym))
)
```

```
## RxXdfData Source
## "lvr_cube.xdf"
## fileSystem: 
##     fileSystemType: native
```

## 繪製大安區的歷史平均成交價

```r
#設定檔案路徑
lvr_cube <- file.path('/home/largitdata','lvr_cube.xdf')

#使用rxLinePlot繪製總成交價變化
rxLinePlot(formula = total_price ~ trading_ym, 
           data= lvr_cube, 
           rowSelection = (
                 area == '大安區' & trading_ym >= '2012-01-01'),
           transforms=list(trading_ym = as.Date(trading_ym))
          )
```

![plot of chunk unnamed-chunk-33](figure/unnamed-chunk-33-1.png) 


## 繪製各區域的成交金額變化

```r
rxLinePlot(formula = total_price ~ trading_ym | area, 
           data= lvr_cube, 
           rowSelection = (trading_ym >= '2012-01-01'),
           transforms=list(trading_ym = as.Date(trading_ym))
)
```

![plot of chunk unnamed-chunk-34](figure/unnamed-chunk-34-1.png) 

## 計算變數相關性

```r
#使用rxCor 計算相關性
rxCor(formula=~ building_sqmeter + total_price, data=lvr_data)
```

```
##                  building_sqmeter total_price
## building_sqmeter        1.0000000   0.7525648
## total_price             0.7525648   1.0000000
```

## 繪製建物大小與價格的關係

```r
rxLinePlot(formula = total_price ~ building_sqmeter, 
           data= lvr_data,
           type= 'p',		   
           rowSelection = (
             trading_ym >= '2012-01-01' &
             trading_target == '房地(土地+建物)'
            ),
           transforms=list(
             trading_ym = as.Date(trading_ym)
             )
)
```

![plot of chunk unnamed-chunk-36](figure/unnamed-chunk-36-1.png) 

## 將資料取log 

```r
rxLinePlot(formula = total_price ~ building_sqmeter, 
           data= lvr_data,
           type= 'p',		   
           rowSelection = (
             trading_ym >= '2012-01-01' &
             trading_target == '房地(土地+建物)'
            ),
           transforms=list(
             trading_ym = as.Date(trading_ym),
             total_price = log(total_price),
             building_sqmeter = log(building_sqmeter)
             )
)
```

![plot of chunk unnamed-chunk-37](figure/unnamed-chunk-37-1.png) 

## 增添資料迴歸線

```r
rxLinePlot(formula = total_price ~ building_sqmeter, 
           data= lvr_data,
           type= c('r','p'),		
           lineColor=c('red'),
           rowSelection = (
             trading_ym >= '2012-01-01' &
             trading_target == '房地(土地+建物)'
            ),
           transforms=list(
             trading_ym = as.Date(trading_ym),
             total_price = log(total_price),
             building_sqmeter = log(building_sqmeter)
             )
)
```

![plot of chunk unnamed-chunk-38](figure/unnamed-chunk-38-1.png) 

## 求出迴歸模型

```r
lmfit <- rxLinMod(
                  formula=total_price ~ building_sqmeter, 
                  data=lvr_data
            )


summary(lmfit)
```

```
## Call:
## rxLinMod(formula = total_price ~ building_sqmeter, data = lvr_data)
## 
## Linear Regression Results for: total_price ~ building_sqmeter
## Data: lvr_data (RxXdfData Data Source)
## File name: /home/largitdata/lvr.xdf
## Dependent variable(s): total_price
## Total independent variables: 2 
## Number of valid observations: 102054
## Number of missing observations: 0 
##  
## Coefficients:
##                    Estimate Std. Error t value Pr(>|t|)    
## (Intercept)      -2046875.5   270522.9  -7.566 2.22e-16 ***
## building_sqmeter   220802.7      604.8 365.079 2.22e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 83010000 on 102052 degrees of freedom
## Multiple R-squared: 0.5664 
## Adjusted R-squared: 0.5663 
## F-statistic: 1.333e+05 on 1 and 102052 DF,  p-value: < 2.2e-16 
## Condition number: 1
```

## 產生預測結果

```r
#使用rxPredict 產生預測結果
rxPredict(lmfit, data = lvr_data)

#使用rxGetInfo檢視預測變數
rxGetInfo(lvr_data, getVarInfo = TRUE)
```

```
## File name: /home/largitdata/lvr.xdf 
## Number of observations: 102054 
## Number of variables: 32 
## Number of blocks: 1 
## Compression type: zlib 
## Variable information: 
## Var 1: .rxRowNames, Type: integer, Low/High: (0, 9683)
## Var 2: area
##        12 factor levels: 大安區 中正區 大同區 內湖區 信義區 ... 中山區 萬華區 北投區 文山區 南港區
## Var 3: trading_target, Type: character
## Var 4: address, Type: character
## Var 5: land_sqmeter, Type: numeric, Storage: float32, Low/High: (0.0000, 46193.0000)
## Var 6: city_land_type, Type: character
## Var 7: non_city_land_type, Type: character
## Var 8: non_city_code, Type: numeric, Storage: float32, Low/High: (NA, NA)
## Var 9: trading_ymd, Type: Date, Low/High: (1973-08-29, 2016-05-16)
## Var 10: trading_num, Type: character
## Var 11: floor, Type: character
## Var 12: total_floor, Type: character
## Var 13: building_type, Type: character
## Var 14: main_purpose, Type: character
## Var 15: built_with, Type: character
## Var 16: finish_ymd, Type: Date, Low/High: (1911-05-06, 2016-03-11)
## Var 17: building_sqmeter, Type: numeric, Storage: float32, Low/High: (0.0000, 69125.5312)
## Var 18: room, Type: integer, Low/High: (0, 168)
## Var 19: living_room, Type: integer, Low/High: (0, 80)
## Var 20: bath, Type: integer, Low/High: (0, 174)
## Var 21: compartment, Type: character
## Var 22: management, Type: character
## Var 23: total_price, Type: numeric, Low/High: (0.0000, 27033999999.0000)
## Var 24: price_per_sqmeter, Type: numeric, Storage: float32, Low/High: (0.0000, 62685712.0000)
## Var 25: parking_type, Type: character
## Var 26: parking_sqmeter, Type: numeric, Storage: float32, Low/High: (0.0000, 1450000.0000)
## Var 27: parking_price, Type: integer, Low/High: (0, 2.4e+08)
## Var 28: comments, Type: character
## Var 29: numbers, Type: character
## Var 30: new_price, Type: numeric, Low/High: (0.0000, 150000003.3528)
## Var 31: trading_ym, Type: Date, Low/High: (1973-08-01, 2016-05-01)
## Var 32: total_price_Pred, Type: numeric, Low/High: (-2046875.4750, 15261053750.6636)
```

## 使用rxLogit 建立Logistic Regression 模型

```r
# 讀取資料
mortData <- file.path(rxGetOption('sampleDataDir'), 'mortDefaultSmall.xdf')
rxGetInfo(mortData, getVarInfo = TRUE)
```

```
## File name: /usr/lib64/microsoft-r/8.0/lib64/R/library/RevoScaleR/SampleData/mortDefaultSmall.xdf 
## Number of observations: 1e+05 
## Number of variables: 6 
## Number of blocks: 10 
## Compression type: zlib 
## Variable information: 
## Var 1: creditScore, Type: integer, Low/High: (470, 925)
## Var 2: houseAge, Type: integer, Low/High: (0, 40)
## Var 3: yearsEmploy, Type: integer, Low/High: (0, 14)
## Var 4: ccDebt, Type: integer, Low/High: (0, 14094)
## Var 5: year, Type: integer, Low/High: (2000, 2009)
## Var 6: default, Type: integer, Low/High: (0, 1)
```

```r
# 建立logitModel
logitModel <- rxLogit(formula = default ~ houseAge + F(year) + ccDebt + creditScore + yearsEmploy, data = mortData)

# 觀看Model Summary
summary(logitModel)
```

```
## Call:
## rxLogit(formula = default ~ houseAge + F(year) + ccDebt + creditScore + 
##     yearsEmploy, data = mortData)
## 
## Logistic Regression Results for: default ~ houseAge + F(year) +
##     ccDebt + creditScore + yearsEmploy
## Data: mortData (RxXdfData Data Source)
## File name:
##     /usr/lib64/microsoft-r/8.0/lib64/R/library/RevoScaleR/SampleData/mortDefaultSmall.xdf
## Dependent variable(s): default
## Total independent variables: 15 (Including number dropped: 1)
## Number of valid observations: 1e+05
## Number of missing observations: 0 
## -2*LogLikelihood: 2946.1416 (Residual deviance on 99986 degrees of freedom)
##  
## Coefficients:
##               Estimate Std. Error z value Pr(>|z|)    
## (Intercept) -6.939e+00  7.957e-01  -8.720 2.22e-16 ***
## houseAge     2.877e-02  7.036e-03   4.089 4.33e-05 ***
## F_year=2000 -3.738e+00  3.275e-01 -11.413 2.22e-16 ***
## F_year=2001 -2.701e+00  2.268e-01 -11.906 2.22e-16 ***
## F_year=2002 -3.798e+00  3.386e-01 -11.216 2.22e-16 ***
## F_year=2003 -4.644e+00  5.150e-01  -9.018 2.22e-16 ***
## F_year=2004 -4.492e+00  4.400e-01 -10.208 2.22e-16 ***
## F_year=2005 -4.533e+00  4.665e-01  -9.717 2.22e-16 ***
## F_year=2006 -4.544e+00  4.787e-01  -9.491 2.22e-16 ***
## F_year=2007 -3.130e+00  2.629e-01 -11.905 2.22e-16 ***
## F_year=2008 -5.695e-01  1.230e-01  -4.631 3.64e-06 ***
## F_year=2009    Dropped    Dropped Dropped  Dropped    
## ccDebt       1.320e-03  3.932e-05  33.574 2.22e-16 ***
## creditScore -7.824e-03  1.081e-03  -7.240 2.22e-16 ***
## yearsEmploy -2.675e-01  2.741e-02  -9.762 2.22e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Condition number of final variance-covariance matrix: 6.2216 
## Number of iterations: 10
```




