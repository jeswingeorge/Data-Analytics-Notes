from matplotlib import pyplot as plt

plt.bar([1,3,5,7,9],[5,2,7,9,11], label = 'Example one')
# plt.bar([2,4,6,8,10],[8,6,2,5,6], label = 'Example two')
# Can also adjust colors
plt.bar([2,4,6,8,10],[8,6,2,5,6], label = 'Example two', color = 'g')

plt.legend()
plt.xlabel('Bar Number')
plt.ylabel('Bar Height')

plt.title('Bar graph')
plt.show()

