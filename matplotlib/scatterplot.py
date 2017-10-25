from matplotlib import pyplot as plt

x = list(range(1,9))
y1 = [2,5,8,11,3,5,1,7]
y2 = [7,1,3,9,2,7,3,4]

plt.scatter(x,y1,label = 'skitscat', color = 'k')
plt.scatter(x,y2,label = 'kit-kat', color = 'r')

plt.xlabel('x')
plt.ylabel('y')
plt.title('scatter')
plt.legend()
plt.show()
