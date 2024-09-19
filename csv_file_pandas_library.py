import pandas as pd 
filename = "POWER_Point_Monthly_20100101_20221231_028d51N_085d51E_UTC.csv"
#print(filename)
#The following code prints the data that are in the rows 1
df = pd.read_csv(filename, nrows= 1)
print(df)
#This code prints the data that are in column 0.
df1 = pd.read_csv(filename, usecols = range(1))
print(df1)

#If we need to skip any rows form the csv file 
df2 = pd.read_csv(filename, skiprows = 23)
print(df2)

#If we want to change the index name in columnn
df3 = pd.read_csv(filename, index_col='YEAR')
print(df3)

#To change the header of the csv file. If we select any rows the data above the given rows will be deleted. 
df4 = pd.read_csv(filename, header=13)
print(df4)

#Prefix is also the header type parameter as it provides the name for the header if needed
df5 = pd.read_csv(filename, header=None, names=['A', 'B', 'C', 'D', 'E'])
print(df5)

#The pandas library provide us the luxury to show first five rows and last five rows from the csv file in python 
dff = pd.read_csv(filename, index_col="YEAR")
print(dff.head())

# To print last 5 rows 
print(dff.tail())

#To  change the datatype of any columns
x = pd.read_csv(filename, header= 2, dtype={'JAN': 'int'})
print(x)
