import csv
import numpy as np
import matplotlib.pyplot as plt
from scipy.stats import norm
import statistics

# Initialize empty lists for each column
open_data = []
high_data = []
low_data = []
close_data = []
volume_data = []
marketCap_data = []
timestamp_data = []

# Replace 'your_data.csv' with the actual file path of your CSV data
with open('ETH_ALL_graph_coinmarketcap.csv', 'r') as csv_file:
    csv_reader = csv.reader(csv_file, delimiter=';')  # Specify the delimiter as ';'

    # Skip the header row if it exists
    next(csv_reader, None)

    for row in csv_reader:
        open_data.append(float(row[0]))
        high_data.append(float(row[1]))
        low_data.append(float(row[2]))
        close_data.append(float(row[3]))
        volume_data.append(float(row[4]))
        marketCap_data.append(float(row[5]))
        timestamp_data.append(row[6])

# Now, you have separate arrays for each column
open_array = np.array(open_data)
high_array = np.array(high_data)
low_array = np.array(low_data)
close_array = np.array(close_data)
volume_array = np.array(volume_data)
marketCap_array = np.array(marketCap_data)
timestamp_array = np.array(timestamp_data)

op_mean = volume_array.mean()
op_std = volume_array.std()
op_var = volume_array.var()

# print(op_mean,op_std,op_var)

# xmin,xmax = volume_array.min(),volume_array.max()
# x = np.linspace(xmin,xmax,100)
my_array = np.zeros(np.size(open_array))

for i in range(np.size(open_array)):
    my_array[i] = abs(marketCap_array[i] / volume_array[i])



plt.plot(timestamp_array,volume_array)
plt.title("Ethereum")
plt.show()