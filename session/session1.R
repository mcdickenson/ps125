# PS 125
# Session 1
# 8/29/14
# Matt Dickenson

# This line is a comment
# It doesn't do anything

# Getting started
print("Hello world")

# How to get help
help(sqrt) # help w/ functions
?sqrt # same thing
help.start() # lots of help
help.search("sqrt") # what am I looking for? Fuzzy matching
example(sqrt)

# Setting a variable
x = 1
y = 2
z = x + y
print(z)

# Creating a vector
vector = c(x, y, z)
print(vector)
vector + 1
vector * 2

# Other ways to create vectors
rep(1, 5) # repeate the value 1, 5 times
seq(1, 21, by=2) # make the sequence 1 to 21 moving by increments of 2
rep(seq(2,20, by=2), 2) # repeate the pattern 2, 4, ... 20, twice
rep(c(1,4), c(3,2)) # repeat 1, 3 times and 4, twice
rep(c(1,4), each=3) # repeat each value 3 times

# Creating a matrix
mx = matrix(c(1,2,3,4,5,6,7,8,9), nrow=3, ncol=3)
print(mx)
mx[1,1]
mx[1, ]
mx[ ,1]

my = matrix(c(1,2,3,4,5,6,7,8,9), nrow=3, ncol=3, byrow=TRUE)
?matrix
print(my)
mx[1,1]
mx[1, ]
mx[ ,1]

# Creating a data frame
dfx = as.data.frame(mx)
colnames(dfx)
rownames(dfx)

dfy = as.data.frame(my)
colnames(dfy)
rownames(dfy)

colnames(dfy) = c("first", "second", "third")
rownames(dfy) = c("row1", "row2", "row3")

dfy$fourth = c(0, 0, 0) # add a column
dfy$fifth = dfy$first + dfy$third

rbind(dfy, c(5, 4, 3, 2, 1)) # add a row

colnames(dfy)
rownames(dfy)
print(dfy)

sum(dfy$second)
mean(dfy$second)
median(dfy$second)

sum(dfy["row1",])
mean(dfy["row1",])
median(dfy["row1",])
# why do you think the second two give errors?


# Reading in data
getwd()
setwd('~/dropbox/ps125/session')

# CSV
?read.csv
csvdata = read.csv('usgdp.csv', as.is=TRUE)

class(csvdata)
head(csvdata)
tail(csvdata)
colnames(csvdata)[2] = "gdp"
summary(csvdata$gdp)

write.table(csvdata, file='usgdp-copy.csv', sep=",")

# TSV
?read.table
tsvdata = read.table('usgdp.tsv', header=TRUE, sep="\t", as.is=TRUE)
head(tsvdata)
tail(tsvdata)

# Stata .dta file
library(foreign)
?read.dta
dtadata = read.dta('usgdp.dta')
head(dtadata)
tail(dtadata)

# Excel spreadsheet
install.packages("gdata")
library(gdata)
?read.xls

xlsdata = read.xls("usgdp.xls")
head(xlsdata)
tail(xlsdata)
