install.packages("readxl")
library(readxl)
dustdata <- read_excel("C:/Rstudy/dustdata.xlsx")
View(dustdata)
str(dustdata)
install.packages("dplyr")
library(dplyr)
dustdata_anal <- dustdata %>% filter(area %in% c("강남구","영등포구"))
dustdata_anal
count(dustdata_anal, yyyymmdd) %>% arrange(desc(n))
count(dustdata_anal, area) %>% arrange(desc(n))
dust_anal_a <-subset(dustdata_anal, area =="강남구")
dust_anal_b <- subset(dustdata_anal, area == "영등포구")
dust_anal_a
dust_anal_b

install.packages("psych")
library(psych)
describe(dust_anal_a$finedust)
describe(dust_anal_b$finedust)

boxplot(dust_anal_a$finedust, dust_anal_b$finedust,
        main="미세먼지 분표도(강남,영등포)", xlab="AREA", names =c("강남구","영등포구"),
        ylab= "FINEDUST_PM", col= c('blue',"green"))
