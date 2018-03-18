setwd("F:/projects/Market")

library(arules)
# read.transactions() gives the sparse matrix

grocer<- read.transactions("grocer.csv",sep=",")

summary(grocer)
labels(grocer)

# 9840 rows and 172 columns
# 0.0256 shows the proportion of non-zero cells or cells showing transactions
# 1692480*0.0256=43327 items are there

# We can see the most frequent items occuring

# A total of 2159 has single transactions and so on
# Then the minimum, maximum and the quantiles are shown on the number of transactions

# Seeing the proportions of transactions that contain the items
itemFrequency(grocer[,1:5])
# it shows the proportions with sparse matrix in ordered format

# We can view the transactions
inspect(grocer[1:10])

# We can plot the frequency of the items as bar plot
itemFrequencyPlot(grocer,topN=30,xlab="Items",ylab="Item Frequency")      # with top 30 items
itemFrequencyPlot(grocer,support=0.1,horiz=FALSE,cex.names=1,topN=8,ylab="Items",xlab="Item Frequency")  # with at least 10% support

# viewing the matrix of 100 random samples 

image(sample(grocer, 100))

# Training a model for the dataset

grorules <- apriori(grocer, parameter = list(support = 0.006, confidence = 0.25, minlen = 2))
summary(grorules)  # evluating the model performance

inspect(grorules[1:5])    # set of rules that are filtered out by the association rules

# Out of all the rules, some rules can be actionable, trivial or inexplicable
# We can find out for improving the model performance

inspect(sort(grorules, by = "lift")[1:10])    # sorted 

# Suppose we want to see the pattern of buying for a single product: whole milk
milkrules <- sort(subset(grorules, items %in% "whole milk"),by="lift")
inspect(milkrules)

# We can save the results and share the results
write(grorules, file = "grorules.csv",sep = ",", quote = TRUE, row.names = FALSE)
grorules_df <- as(grorules, "data.frame")
str(grorules_df)
