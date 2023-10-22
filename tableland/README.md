# Magical Tableland

**We used the Tableland Studio CLI for our project**
*Team Name* : VasuK111
[*Dev Address*](https://studio.tableland.xyz/vasuk111/ethonline23/deployments/default/bnb_data_420_37)

So ya, once we were done with data, it was the time to store it. We did it on Web3.storage but there was one major issue over our head.
This is financial data and that has to be updated as every single day passes down. How do we do that with traditional IPFS style databases?

This is where Tableland does it's magic!

It gives the flexibility to use SQLite databases & run personalised queries. 


# Challenges

```
$ studio import-data users ./data.csv --pid eac4b0f2-ab4d-41ec-9789-19f0a4905615 
```
* They couldn't add the feature to directly populate a table with csv files as shown above:

So, we used the unconventional method as suggested by the dev team at Tableland .

We first converted [CSV to SQL](https://www.convertcsv.com/csv-to-sql.htm),
then, we used the [Studio Console UI](https://console.tableland.xyz/) for query testing. 


Then, we used the :
```
tableland write --file "./bnb.sql"
```
# Results
We were able to successfully store the financial data for BNB token on Tableland & deployed it on the OP-Goerli Testnet!

