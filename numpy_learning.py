#This program show the concatenation operation in numpy function
import numpy as np
arr1 = [[1, 2],
[3,4]]

arr2 = [[5, 6, 7],
[8, 9, 10 ]]

result = np.concatenate((arr1, arr2), axis = 1)
print(result)
#Here, the axis = 1 is used as the above program has the same number of columns .

#Program that is to concatenate the arrays having equal rows, we used axis = 0
arr3 = [[1, 2, 3],
[1,2,3]]

arr4 = [[3, 4,9],
[3, 4, 9]]

result_row = np.concatenate((arr3, arr4 ), axis =0)
print(result_row)

#Doing the transpose operation in numpy library
arr6 = np.transpose(arr4,axes=None)
print(arr6)
