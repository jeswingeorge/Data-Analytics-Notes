from matplotlib import pyplot as plt

population_ages = [22,55, 62, 45, 21, 22,45,12,89,65,45,90,91,99,78,88,55,43,26,70,
                   13,69,57,21,9,99,65]

bins = list(range(0,100,10))

plt.hist(population_ages, bins, histtype = 'bar', rwidth = 0.5)

plt.xlabel('x')
plt.ylabel('y')

plt.title('histogram')
plt.legend()
plt.show()

