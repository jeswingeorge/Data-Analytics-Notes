from matplotlib import pyplot as plt

days = [1,2,3,4,5]

sleeping = [7,8,6,11,7]
eating = [2,3,4,3,2]
working = [7,8,7,2,2]
playing = [8,5,7,8,13]

plt.plot([], [], color = 'm', label = 'Sleeping', linewidth = 5)
plt.plot([], [], color = 'c', label = 'Working', linewidth = 5)
plt.plot([], [], color = 'r', label = 'Eating', linewidth = 5)
plt.plot([], [], color = 'k', label = 'Playing', linewidth = 5)

# Be careful of the order in which they are given
plt.stackplot(days, sleeping, working, eating, playing, colors = ['m','c','r','k'])

plt.xlabel('X')
plt.ylabel('Y')
plt.title('Area Plot')
plt.legend()
plt.show()
