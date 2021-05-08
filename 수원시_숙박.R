install.packages("readxl")
library(readxl)
Ho <- read_excel("C:/Rstudy/수원시_숙박.xlsx")
View(Ho)
head(Ho)

addr <- substr(Ho$소재지전체주소,12,16)
head(addr)


addr_n <- gsub("[0-9]", "" ,addr)
addr_t <- gsub(" ", "", addr_n)
head(addr_t)

library(dplyr)

addr_c <- addr_t %>% table()%>% data.frame()
addr_c

install.packages("treemap")
library(treemap)

treemap(addr_c, index = ".", vSize = "Freq", title = "수원시 숙박 업소")
