import numpy as np
arr1 = np.array([[1, 2, 3 ],
[5, 5, 5],
[9, 9, 9],
[6, 6, 6]])

arr2 = np.array([
[9, 9, 9, 9],
[10, 10, 10, 10],
[1, 1, 1, 1]])

resultant_array = np.matmul(arr1, arr2)
print(resultant_array)