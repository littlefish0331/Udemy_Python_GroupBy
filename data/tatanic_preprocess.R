
# Basic Information -------------------------------------------------------
# Author: Steve, Yu
# Date: Sun Sep 30 09:26:06 2018
# --
# Topic:
# Date:
# Modification:
# --
#
# Setting Path ------------------------------------------------------------
setwd("D:/Learn/Python/[Udemy][Python][GroupBy]/")
getwd()

# Package -----------------------------------------------------------------
library(dplyr)
library(data.table)
rm(list = ls()); gc()

# Reference URL -----------------------------------------------------------
# 



# 檔案目標 --------------------------------------------------------------------
# Tatanic.csv，取出需要的欄位
# 弄成像影片中的資料那樣




# 讀取資料 --------------------------------------------------------------------
data <- fread("data/Titanic.csv")
data %>% colnames()
pick <- c("PassengerId", "Survived", "Pclass", "Sex", "Age",
          "SibSp", "Parch", "Fare", "Embarked", "Cabin")
idx <- (colnames(data) %in% pick) %>% which()
tmp01 <- data[, idx, with = F]
tmp01$Cabin <- tmp01$Cabin %>% substring(text = ., first = 1, last = 1)
tmp02 <- tmp01[,c(1:8, 10, 9), with = F]
fwrite(x = tmp02, file = "data/titanic_ver01.csv", row.names = F)


