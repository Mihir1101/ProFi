import csv

# Initialize empty lists for each column
open_data = []
high_data = []
low_data = []
close_data = []
volume_data = []
marketCap_data = []
timestamp_data = []

# Replace 'your_data.csv' with the actual file path of your CSV data
# /APE/APE_All_graph_coinmarketcap.csv
with open('./APE/APE_All_graph_coinmarketcap.csv', 'r') as csv_file:
    csv_reader = csv.reader(csv_file, delimiter=';')  # Specify the delimiter as ';'

    # Skip the header row if it exists
    next(csv_reader, None)

    for row in csv_reader:
        open_data.append(int(((float(row[0])) * 1e10)))
        high_data.append(int(((float(row[1])) * 1e10)))
        low_data.append(int(((float(row[2])) * 1e10)))
        close_data.append(int(((float(row[3])) * 1e10)))
        volume_data.append(int(((float(row[4])) * 1e10)))
        marketCap_data.append(int(((float(row[5])) * 1e10)))

# Printing the segregated data
print("open = ", open_data,";")
print("close = ", low_data,";")
print("high = ", high_data,";")
print("low = ", low_data,";")
print("volume = ",volume_data,";")
print("marketCap = ", marketCap_data,";")
print("markets = ", 1880000000000 ,";")
print("github_commits = ", 94130000000000,";")
