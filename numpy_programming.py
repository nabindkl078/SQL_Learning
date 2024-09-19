#This is the python program that is used to calculate the production of oranges in pokhara.
w1, w2, w3 = 1, 2, 3
pokhara_tempt = 17
pokhara_rainfall= 50
pokhara_humidity = 60

pokhara_oranges_yield = pokhara_tempt * w1 + pokhara_rainfall * w2 + pokhara_humidity * w3
print("The total amount of Oranges that is being yield by pokhara is ", pokhara_oranges_yield)
print("{} oranges are being produced in pokhara. ".format(pokhara_oranges_yield))

#To make the above program easier we can use the list
pokhara = [17, 50, 60]
kathmandu = [91, 88, 64]
#The three data represents temperature, rainfall and humidity of that place. 
weights = [w1, w2, w3 ]
def crop_yield(region, weights):
    result = 0
    for x, w in zip(region, weights):
        result = result + x * w
    return result 
#The above program takes the data from calling function and hence calculate the required result. 
pokhara_production = crop_yield(pokhara, weights)
kathmandu_production = crop_yield(kathmandu, weights)
print("The total production of crops in pokhara area is ", pokhara_production)
print("The total production of crops in kathmandu area is ", kathmandu_production)

#The numpy function can be imported as:
import numpy as np 
#convert the list into numpy array
weight1 = [1, 2, 3]
weight2 = [4, 5, 6]
arr1 = np.array(weight1)
arr2 = np.array(weight2)
resultant_product = np.dot(arr1, arr2)
print("The product of two weighted matrix is ", resultant_product)

#The execution time of the same result problem is different. The problem solving using python is time consuming than numpy function.

#The numpy matrix can use multi-dimensional matrix
climate_data = np.array(
    [[63, 45, 12],
    [77, 83, 45],
    [11, 22, 33],
    [44, 55, 66]
    ])
what_is_that = climate_data.shape
print(what_is_that)

#matrix multiplication of two dimensional matrices 
matrix1 = np.array([
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
])
matrix2 = np.array([
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
])
matrix_multiplication = np.matmul(matrix1, matrix2)
print(matrix_multiplication)

#the function that can be used to calculate the sum of matrix
print(matrix_multiplication.sum())

#Working with CSV files:
import numpy as np

file_name = 'CSV file.csv'
climate_data = np.genfromtxt('CSV file.csv', delimiter=",", skip_header = 1)
print(climate_data)
print(climate_data.shape)