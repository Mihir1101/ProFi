# The Algorithm 

Our algorithm utilizes algebric group and ring theory to get the following formula : 

```
for i in range(len(algo_array) - 1):
    algo_array[i] = (2 * normalize_between_zero_and_one(abs((high_array[i] - low_array[i]) / (close_array[i] - open_array[i])))) + (2 * (1 - (abs(marketCap_array[i] - marketCap_array[i+1])) / 100000000000)) + (2 * (1 - (abs(volume_array[i] - volume_array[i+1])) / 100000000000)) + (1 * ((markets_for_op) / 10000)) + (2 * ((github_commits_for_op) / 100000)) + buddy(close_array[i],open_array[i])
```