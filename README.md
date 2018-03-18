# Recommender-System-using-Market-Basket-Analysis

Market Basket Analysis of the transactional data from a grocery store. 
This method is generally used for Recommender Systems for various online shopping sites.
It helps a grocery chain to improve its inventory requirements, advertisement promotions etc.

The dataset contains over 9000 transactions in a month.
There were various brands for the items, but they were not concerned
about the brands, so it reduced the items into manageable types.
The rows shows the transactional data and the columns as features.

The objective of the analysis was to boost up the marketing campaigns of the particular store and 
also to set up a recommender system for their online shopping by using Association Rules Algorithm.
When the data is loaded, the features are arranged in each columns.

The steps are:

1) Data Preparation by creating a sparse matrix where each row will indicate a transaction.
The sparse matrix has the items in the columns. The matrix stores the cells storing an item.
2) Viewing the proportions of the transactions containing the items. We can also view the frequency of the items by applying various filters on the frequency plot.
3) Training the model by selecting appropriate support and confidence parameters.
4) The rules found out are sorted accordingly and we can find out the particular categories of items of interest.
5) Saving the rules as dataframe to present to the people for creation of recommender systems.
