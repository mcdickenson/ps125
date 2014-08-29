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

###############

# Exploratory data analysis

data = csvdata
colnames(data) = c("year", "gdp", "pop", "spend") 
head(data)
head(csvdata)

summary(data)
# similar:
# min(data$gdp)
# quantile(data$gdp, 0.25)
# median(data$gdp)
# mean(data$gdp)
# quantile(data$gdp, 0.75)
# max(data$gdp)


### scatterplots

plot(data$year, data$gdp)

# pdf("myplot.pdf", height=4, width=4)
plot(x=data$year, y=data$gdp,
  # xlab="Year", ylab="$US (bn)",
  # type="l",
  # lwd=2,
  # col="blue",
  # xlim=c(1950, 1960),
  # ylim=c(0,500)
)
# lines(x=data$year, y=data$spend,
#   type="o", 
#   pch=16,
#   lwd=2,
#   col="green"
# )
# points(x=data$year, y=data$pop,
#   cex=2
# )
# title("US GDP", col.main="red")
# legend("topleft", 
#   legend=c("GDP", "Spending"),
#   pch=16,
#   col=c("blue", "green")
# )
# dev.off()

### barplot
barplot(data$gdp)
barplot(as.matrix(data),
  beside=TRUE,
  col=rainbow(10)
)

### histogram
hist(data$pop)

### pie chart
pie(data$gdp,
  labels=data$year
)

### misc
# 25 different symbols to use in your charts

# Make an empty chart
plot(1, 1, xlim=c(1,5.5), ylim=c(0,7), type="n", ann=FALSE)

# Plot digits 0-4 with increasing size and color
text(1:5, rep(6,5), labels=c(0:4), cex=1:5, col=1:5)

# Plot symbols 0-4 with increasing size and color
points(1:5, rep(5,5), cex=1:5, col=1:5, pch=0:4)
text((1:5)+0.4, rep(5,5), cex=0.6, (0:4))

# Plot symbols 5-9 with labels
points(1:5, rep(4,5), cex=2, pch=(5:9))
text((1:5)+0.4, rep(4,5), cex=0.6, (5:9))

# Plot symbols 10-14 with labels
points(1:5, rep(3,5), cex=2, pch=(10:14))
text((1:5)+0.4, rep(3,5), cex=0.6, (10:14))

# Plot symbols 15-19 with labels
points(1:5, rep(2,5), cex=2, pch=(15:19))
text((1:5)+0.4, rep(2,5), cex=0.6, (15:19))

# Plot symbols 20-25 with labels
points((1:6)*0.8+0.2, rep(1,6), cex=2, pch=(20:25))
text((1:6)*0.8+0.5, rep(1,6), cex=0.6, (20:25))
