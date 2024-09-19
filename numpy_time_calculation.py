#illustration of memory usage
import numpy as np
import time 
import sys
L = range(1000)
print("The size of memory used by list", sys.getsizeof(L))

N = np.array(1000)
print("The size of memory used by numpy", N.size*N.itemsize)


#Illustrate the function of numpy for matrix slicing
import numpy as np 
a = np.array([
    [1, 2, 3],
    [1, 3, 4]])
print(a[0,2])
print(a[1, 2])
print(a[0:,2])

#The readymade library that perform the mathematical operation in numpy library using python
print(a.sum())
print(a.max())
print(a.min())
print(a.mean())
print(a.std())