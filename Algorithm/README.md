# ProFi's Algorithm 

The core part of ProFi lies in it's own algorithm which was developed through many sleepless nights & a lot of sweat flown away...Eww!

# Key Terminologies
* *Algorithm* - A general formula applicable to all tokens with an accuracy of 85% +.
* *Weights* - Has an integer value of 1 or 2 & is assigned to each parameter.
* *Score* - Calculated out of 10. It is a measure of safeness of a token. Higher the score, safer is the token
  
We used the simplistic yet effective concept of Weights & biases & assigned weights according to the importance of each parameter in the final score.

The algorithm takes into account the following factors & utilizes algebric group and ring theory to get the following formula : 

```
for i in range(len(algo_array) - 1):
    algo_array[i] = (2 * normalize_between_zero_and_one(abs((high_array[i] - low_array[i]) / (close_array[i] - open_array[i])))) + (2 * (1 - (abs(marketCap_array[i] - marketCap_array[i+1])) / 100000000000)) + (2 * (1 - (abs(volume_array[i] - volume_array[i+1])) / 100000000000)) + (1 * ((markets_for_op) / 10000)) + (2 * ((github_commits_for_op) / 100000)) + buddy(close_array[i],open_array[i])
```
