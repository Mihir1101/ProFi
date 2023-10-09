import csv
import numpy as np
import matplotlib.pyplot as plt
from scipy.stats import norm


def normalize_between_zero_and_one(value):
    while value >= 1.0:
        value /= 10.0
    while value < 0.0:
        value *= 10.0
    return value

# Initialize empty lists for each column
open_data = []
high_data = []
low_data = []
close_data = []
volume_data = []
marketCap_data = []
timestamp_data = []

# Replace 'your_data.csv' with the actual file path of your CSV data
with open('ARB_ALL_graph_coinmarketcap.csv', 'r') as csv_file:
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
markets_for_arb = 261
twitter_followers_for_arb = 871100
github_commits_for_arb = 9413

algo_array = np.zeros(np.size(open_array))

for i in range(len(algo_array) - 1):
    algo_array[i] = (2 * normalize_between_zero_and_one(abs((high_array[i] - low_array[i]) / (close_array[i] - open_array[i])))) + (2 * (1 - (abs(marketCap_array[i] - marketCap_array[i+1])) / 100000000000)) + (2 * (1 - (abs(volume_array[i] - volume_array[i+1])) / 100000000000)) + (1 * ((markets_for_arb) / 10000)) + (2 * ((github_commits_for_arb) / 100000))
print(algo_array.mean())
plt.plot(timestamp_array,algo_array)
plt.title("Arbitrum")
plt.show()